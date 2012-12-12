module EveCorporation
  module Starbases

    def self.init(user)
      @corporation = user.corporations.where(:corp_id => user.corporation_id).first
      @starbases = @corporation.starbases
      if @starbases.exists?
        if @starbases.first.cached_until <= DateTime.now
          @starbases.destroy_all
          create(user)
        else
          #EveCorporation::StarbaseDetails.init(user)
        end
      else
       create(user)
      end
    end

    def self.create(user)
      @eve = starbase_list_eve_api(user)
      @corporation = user.corporations.where(:corp_id => user.corporation_id).first

      @eve.starbases.each do |starbase|
        @pos = Starbase.new
        @pos.corporation_id = @corporation.id
        @pos.item_id = starbase.itemID
        @pos.type_id = starbase.typeID
        @pos.location_id = starbase.locationID
        @pos.moon_id = starbase.moonID
        @pos.state = starbase.state
        @pos.state_timestamp = starbase.stateTimestamp
        @pos.online_timestamp = starbase.onlineTimestamp
        @pos.standing_owner_id = starbase.standingOwnerID
        @pos.cached_until = @eve.cached_until
        @pos.save
      end
    end

    private
    def self.starbase_list_eve_api(user)
      begin
        api = init_eve_api(user)
        api.scope = 'corp'
        unless user.corp_apisecret.nil? and user.corp_apikey.nil?
          api.StarbaseList()
        end
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
        return false
      end
    end

    def self.init_eve_api(user)
      begin
        unless user.corp_apisecret.nil? and user.corp_apikey.nil?
          EAAL::API.new(user.corp_apikey,user.corp_apisecret)
        end
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
      end
    end
  end

  module StarbaseDetails

    def self.init(user)
      @corporation = user.corporations.where(:corp_id => user.corporation_id).first
      @corporation.starbases.each do |starbase|
        if starbase.starbase_detail.exists?
          if starbase.starbase_detail.first.cached_until <= DateTime.now
            starbase.starbase_detail.destroy
            create(user,starbase)
          end
        else
          create(user,starbase)
        end
      end
    end

    def self.create(user,starbase)
      @eve2 = starbase_detail_eve_api(user, starbase.itemID)
      if @eve2
        @detail = StarbaseDetail.new
        @detail.cached_until = @eve2.cached_until
        @detail.starbase_id = starbase.id
        @detail.state = @eve2.state
        @detail.state_timestamp = @eve2.stateTimestamp
        @detail.online_timestamp = @eve2.onlineTimestamp
        @detail.save

        @generalSettings = @eve2.generalSettings.container
        @generalSettings.keys.each do |key|
          @setting = StarbaseDetailSetting.new
          @setting.starbase_detail_id = @detail.id
          @setting.name = key
          @setting.value = @generalSettings[key]
          @setting.save
        end

        @combatSettings = @eve2.combatSettings.container.to_options
        @combatSettings.keys.each do |key|
          @combat = StarbaseDetailCombatSetting.new
          @combat.starbase_detail_id = @detail.id
          @combat.name = @combatSettings[key].name
          @combat.value = @combatSettings[key].value
          @combat.save

          @attribs = @combatSettings[key].attribs
          @attribs.keys.each do |key|
            @attrib = StarbaseDetailCombatSettingAttrib.new
            @attrib.starbase_detail_combat_setting_id = @combat.id
            @attrib.name = key
            @attrib.value = @attribs[key]
            @attrib.save
          end
        end

        @eve2.fuel.each do |fuel|
          @fuel = StarbaseDetailFuel.new
          @fuel.starbase_detail_id = @detail.id
          @fuel.type_id = fuel.typeID
          @fuel.quantity = fuel.quantity
          @fuel.save
        end
      end
    end

    private
    def self.starbase_detail_eve_api(user,starbase_id)
      begin
        api = init_eve_api(user)
        api.scope = 'corp'
        unless user.corp_apisecret.nil? and user.corp_apikey.nil?
          api.StarbaseDetail(:itemID => starbase_id)
        end
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
        return false
      end
    end

    def self.init_eve_api(user)
      begin
        unless user.corp_apisecret.nil? and user.corp_apikey.nil?
          EAAL::API.new(user.corp_apikey,user.corp_apisecret)
        end
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
      end
    end
  end
end