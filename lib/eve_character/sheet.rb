module EveCharacter
  module Sheet
    def self.update(user)
      @character = user.characters.where(:character_id => user.primary_character_id).first

      if @character
        @eve = character_sheet_eve_api(user)

        @character.cached_until = @eve.cached_until
        if @eve.respond_to?('corporationName')
          @character.corporation_name = @eve.corporationName
          @character.corporation_id = @eve.corporationID
        end
        if @eve.respond_to?('allianceName')
          @character.alliance_name = @eve.allianceName
          @character.alliance_id = @eve.allianceID
        end
        if @eve.respond_to?('cloneName')
          @character.clone_name = @eve.cloneName
          @character.clone_skill_points = @eve.cloneSkillPoints
        end
        @character.balance = @eve.balance
        @character.save

        @eve.skills.each do |newSkill|
          existSkill = @character.character_skills.where(:type_id => newSkill.typeID)
          if existSkill.exists?
            unless existSkill.first.skillpoints.eql?(newSkill.skillpoints) or existSkill.first.level.eql?(newSkill.level)
              existSkill.first.skillpoints = newSkill.skillpoints
              existSkill.first.level = newSkill.level
              existSkill.first.published = newSkill.published
              existSkill.first.save
            end
          else
            @skill = CharacterSkill.new
            @skill.type_id = newSkill.typeID
            @skill.skillpoints = newSkill.skillpoints
            @skill.level = newSkill.level
            @skill.published = newSkill.published
            @skill.character_id = @character.id
            @skill.save
          end
        end

        @eve.attributes.container.each do |newAttr|
          existAttr = @character.character_attributes.where(:name => newAttr[0])
          if existAttr.exists?
            unless existAttr.first.value.eql?(newAttr[1])
              existAttr.first.value = newAttr[1]
              existAttr.first.save
            end
          else
            @attr = CharacterAttribute.new
            @attr.name = newAttr[0]
            @attr.value = newAttr[1]
            @attr.character_id = @character.id
            @attr.save
          end
        end

        @eve.certificates.each do |newCert|
          existCert = @character.character_certificates.where(:certificate_id => newCert.certificateID)
          unless existCert.exists?
            @cert = CharacterCertificate.new
            @cert.certificate_id = newCert.certificateID
            @cert.character_id = @character.id
            @cert.save
          end
        end
      else
        create(user)
      end
    end

    def self.create(user)
      @eve = character_sheet_eve_api(user)
      @character = Character.new
      @character.user_id = user.id
      @character.cached_until = @eve.cached_until
      @character.name = @eve.name
      @character.dob = @eve.DoB
      @character.race = @eve.race
      @character.bloodline = @eve.bloodLine
      @character.ancestry = @eve.ancestry
      @character.gender = @eve.gender
      @character.character_id = @eve.characterID
      if @eve.respond_to?('corporationName')
        @character.corporation_name = @eve.corporationName
        @character.corporation_id = @eve.corporationID
      end
      if @eve.respond_to?('allianceName')
        @character.alliance_name = @eve.allianceName
        @character.alliance_id = @eve.allianceID
      end
      if @eve.respond_to?('cloneName')
        @character.clone_name = @eve.cloneName
        @character.clone_skill_points = @eve.cloneSkillPoints
      end
      @character.balance = @eve.balance
      @character.save

      @eve.skills.each do |newSkill|
        @skill = CharacterSkill.new
        @skill.type_id = newSkill.typeID
        @skill.skillpoints = newSkill.skillpoints
        @skill.level = newSkill.level
        @skill.published = newSkill.published
        @skill.character_id = @character.id
        @skill.save
      end

      @eve.attributes.container.each do |newAttr|
        @attr = CharacterAttribute.new
        @attr.name = newAttr[0]
        @attr.value = newAttr[1]
        @attr.character_id = @character.id
        @attr.save
      end

      @eve.certificates.each do |newCert|
        @cert = CharacterCertificate.new
        @cert.certificate_id = newCert.certificateID
        @cert.character_id = @character.id
        @cert.save
      end
    end

    private
    def self.character_sheet_eve_api(user)
      begin
        api = init_eve_api(user)
        api.scope = 'char'
        api.CharacterSheet(:characterID => user.primary_character_id)
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