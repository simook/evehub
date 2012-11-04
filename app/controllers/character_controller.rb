class CharacterController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @character = charactersheet_eve_api(@user,params[:id])
    @info = characterinfo_eve_api(@user,params[:id])
    render :layout => 'admin'
  end

  private
  def characterinfo_eve_api(user,character)
    api = init_eve_api(user)
    api.scope = 'eve'
    api.CharacterInfo(:characterID => character)
  end

  def charactersheet_eve_api(user,character)
    api = init_eve_api(user)
    api.scope = 'char'
    api.CharacterSheet(:characterID => character)
  end

  def init_eve_api(user)
    EAAL.cache = EAAL::Cache::FileCache.new
    EAAL::API.new(user.apikey,user.secretkey)
  end
end
