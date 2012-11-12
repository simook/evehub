class CorporationController < ApplicationController
  def index
    @user = current_user
    if !@user
     redirect_to login_path
    end
  end

  def show
    @user = User.find(params[:user_id])
    @corp = corpsheet_eve_api(@user,params[:id])
    render :layout => 'admin'
  end

  private
  def corpsheet_eve_api(user,corporation)
    api = init_eve_api(user)
    api.scope = 'corp'
    api.CorporationSheet(:corporationID => corporation)
  end

  def init_eve_api(user)
    EAAL.cache = EAAL::Cache::FileCache.new
    EAAL::API.new(user.apikey,user.secretkey)
  end
end
