module EveCharacter
  module Killmails
    def self.create(user)
      @character = user.characters.where(:character_id => user.primary_character_id).first
      @eve = character_killlog_eve_api(user)

      if @eve
        @character.killlog_cached_until = @eve.cached_until
        @character.save

        @eve.kills.each do |newKill|
          if Killlog.where(:kill_id => newKill.killID).exists?
            return false
          end

          @kill = Killlog.new
          @kill.character_id = @character.id
          @kill.kill_id = newKill.killID
          @kill.kill_time = newKill.killTime
          @kill.moon_id = newKill.moonID
          @kill.solar_system_id = newKill.solarSystemID
          @kill.save

          @victim = KilllogVictim.new
          @victim.killlog_id = @kill.id
          @victim.alliance_id = newKill.victim.allianceID
          @victim.alliance_name = newKill.victim.allianceName
          @victim.character_id = newKill.victim.characterID
          @victim.character_name = newKill.victim.characterName
          @victim.corporation_id = newKill.victim.corporationID
          @victim.corporation_name = newKill.victim.corporationName
          @victim.damage_taken = newKill.victim.damageTaken
          @victim.faction_id = newKill.victim.factionID
          @victim.faction_name = newKill.victim.factionName
          @victim.ship_type_id = newKill.victim.shipTypeID
          @victim.save

          newKill.attackers.each do |newAttacker|
            @attacker = KilllogAttacker.new
            @attacker.killlog_id = @kill.id
            @attacker.alliance_id = newAttacker.allianceID
            @attacker.alliance_name = newAttacker.allianceName
            @attacker.character_id = newAttacker.characterID
            @attacker.character_name = newAttacker.characterName
            @attacker.corporation_id = newAttacker.corporationID
            @attacker.corporation_name = newAttacker.corporationName
            @attacker.damage_done = newAttacker.damageDone
            @attacker.security_status = newAttacker.securityStatus
            @attacker.final_blow = newAttacker.finalBlow
            @attacker.faction_id = newAttacker.factionID
            @attacker.faction_name = newAttacker.factionName
            @attacker.ship_type_id = newAttacker.shipTypeID
            @attacker.weapon_type_id = newAttacker.weaponTypeID
            @attacker.save
          end

          newKill.items.each do |newItem|
           @item = KilllogItem.new
           @item.killlog_id = @kill.id
           @item.flag = newItem.flag
           @item.qty_dropped = newItem.qtyDropped
           @item.qty_destroyed = newItem.qtyDestroyed
           @item.type_id = newItem.typeID
           @item.singleton = newItem.singleton
           @item.save
          end
        end
      end
    end

    private
    def self.character_killlog_eve_api(user)
      begin
        api = init_eve_api(user)
        api.scope = 'char'
        api.Killlog(:characterID => user.primary_character_id)
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
        return false
      end
    end

    def self.init_eve_api(user)
      begin
        EAAL::API.new(user.apikey,user.secretkey)
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
      end
    end
  end
end