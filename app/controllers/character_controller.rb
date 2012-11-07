class CharacterController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:user_id])
    @character = character_sheet_eve_api(@user,params[:id])
    @kills = character_kills_eve_api(@user,params[:id])
    @info = character_info_eve_api(@user,params[:id])
    render :layout => 'admin'
  end

  private
  def character_info_eve_api(user,character)
    api = init_eve_api(user)
    api.scope = 'eve'
    api.CharacterInfo(:characterID => character)
  end

  def character_sheet_eve_api(user,character)
    api = init_eve_api(user)
    api.scope = 'char'
    api.CharacterSheet(:characterID => character)
  end

  def character_kills_eve_api(user,character)
    api = init_eve_api(user)
    api.scope = 'char'
    api.KillLog(:characterID => character)
  end

  def init_eve_api(user)
    EAAL.cache = EAAL::Cache::FileCache.new
    EAAL::API.new(user.apikey,user.secretkey)
  end
end
