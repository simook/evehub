class CorporationController < ApplicationController
  def index
    @user = current_user
    @corporation = current_user.corporation
    @corpadmin = corpadmin
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @corporation}
    end
  end

  def show
    @user = User.find(params[:user_id])
    @corp = corpsheet_eve_api(@user,params[:id])
    render :layout => 'hub'
  end

  def account
    respond_to do |format|
      format.json {render json: accountbalance_eve_api}
    end
  end

  def settings
    @user = current_user
    render :layout => 'slim'
  end

  def starbaselist
    @user = current_user
    @starbases = current_user.starbases
    @corpadmin = corpadmin
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @starbases, :root => false}
    end
  end

  def membertracking
    @corpadmin = corpadmin
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: membertracking_eve_api}
    end
  end

  private
  def user
    current_user
  end

  def corpadmin
    !user.corp_apikey.nil? or !user.corp_apisecret.nil?
  end

  def corpsheet_eve_api
    api = init_eve_api
    api.scope = 'corp'
    if user.corp_apikey.nil? and user.corp_apisecret.nil?
      api.CorporationSheet(:corporationID => user.corporation_id)
    else
      api.CorporationSheet()
    end
  end

  def accountbalance_eve_api
    api = init_eve_api
    api.scope = 'corp'
    api.AccountBalance()
  end

  def starbasedetail_eve_api(id)
    api = init_eve_api
    api.scope = 'corp'
    api.StarbaseDetail(:itemID=>id)
  end

  def starbaselist_eve_api
    api = init_eve_api
    api.scope = 'corp'
    api.StarbaseList()
  end

  def location_eve_api(id)
    api = init_eve_api
    api.scope = 'corp'
    api.Locations(:ids => id)
  end

  def membertracking_eve_api
    api = init_eve_api
    api.scope = 'corp'
    api.MemberTracking(:extended=>1)
  end

  def init_eve_api
    begin
      #EAAL.cache = EAAL::Cache::FileCache.new
      if user.corp_apikey.nil? and user.corp_apisecret.nil?
        eve = EAAL::API.new(user.apikey,user.secretkey)
      else
        eve = EAAL::API.new(user.corp_apikey,user.corp_apisecret)
      end
    rescue EAAL::Exception::EveAPIException => e
      eve = {:status=>'error',:msg=>e.message}
    end
    eve
  end
end
