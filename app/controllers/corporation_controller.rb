class CorporationController < ApplicationController
  def index
    @user = current_user
    @corpadmin = !@user.corp_apikey.nil? or !@user.corp_apisecret.nil?
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: corpsheet_eve_api}
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

  def starbaselist
    @user = current_user
    @corpadmin = !@user.corp_apikey.nil? or !@user.corp_apisecret.nil?
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: starbaselist_eve_api}
    end
  end

  def starbasedetail
    respond_to do |format|
      format.json {render json: starbasedetail_eve_api(params[:id])}
    end
  end

  def starbaselocation
    respond_to do |format|
      format.json {render  json: location_eve_api(params[:id])}
    end
  end

  def membertracking
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: membertracking_eve_api}
    end
  end

  private
  def user
    current_user
  end

  def corpsheet_eve_api
    api = init_eve_api
    api.scope = 'corp'
    api.CorporationSheet()
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
      EAAL::API.new(user.corp_apikey,user.corp_apisecret)
    rescue EAAL::Exception::EveAPIException => e
      {:status=>'error',:msg=>e.message}
    end
  end
end
