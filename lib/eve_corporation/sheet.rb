module EveCorporation
  module Sheet
    def self.update(user)
      @corporation = user.corporation
      if @corporation
        @eve = corporation_sheet_eve_api(user)
        @corporation.station_id = @eve.stationID
        @corporation.station_name = @eve.stationName
        @corporation.description = @eve.description
        @corporation.url = @eve.url
        if @eve.respond_to?('allianceID')
          @corporation.alliance_id = @eve.allianceID
        end
        if @eve.respond_to?('allianceName')
          @corporation.alliance_name = @eve.allianceName
        end
        @corporation.tax_rate = @eve.taxRate
        @corporation.member_count = @eve.memberCount
        if @eve.respond_to?('memberLimit')
          @corporation.member_limit = @eve.memberLimit
        end
        @corporation.shares = @eve.shares
        @corporation.cached_until = @eve.cached_until
        @corporation.save
      else
        create(user)
      end
    end

    def self.create(user)
      @eve = corporation_sheet_eve_api(user)
      @corp = Corporation.new
      @corp.user_id = user.id
      @corp.corp_id = @eve.corporationID
      @corp.name = @eve.corporationName
      @corp.ticker = @eve.ticker
      @corp.ceoid = @eve.ceoID
      @corp.ceo_name = @eve.ceoName
      @corp.station_id = @eve.stationID
      @corp.station_name = @eve.stationName
      @corp.description = @eve.description
      @corp.url = @eve.url
      if @eve.respond_to?('allianceID')
        @corp.alliance_id = @eve.allianceID
      end
      if @eve.respond_to?('allianceName')
        @corp.alliance_name = @eve.allianceName
      end
      @corp.tax_rate = @eve.taxRate
      @corp.member_count = @eve.memberCount
      if @eve.respond_to?('memberLimit')
        @corp.member_limit = @eve.memberLimit
      end
      @corp.shares = @eve.shares
      @corp.cached_until = @eve.cached_until
      @corp.save
    end

    private
    def self.corporation_sheet_eve_api(user)
      begin
        api = init_eve_api(user)
        api.scope = 'corp'
        unless user.corp_apisecret.nil? and user.corp_apikey.nil?
          api.CorporationSheet()
        else
          api.CorporationSheet(:corporationID => user.corporation_id)
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
        else
          EAAL::API.new(user.apikey, user.secretkey)
        end
      rescue EAAL::Exception::EveAPIException => e
        Rails.logger.error "EVE API Exception: #{e.inspect}"
      end
    end
  end
end