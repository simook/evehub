class CharacterController < ApplicationController
  def show
    @user = current_user
    @character = character_sheet_eve_api(@user,params[:id])
    #@info = character_info_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @info}
    end
  end

  def info
    @user = current_user
    @character = character_sheet_eve_api(@user,params[:id])
    @info = character_info_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @character}
    end
  end

  def killlog
    @user = current_user
    @character = character_sheet_eve_api(@user,params[:id])
    @info = character_info_eve_api(@user,params[:id])
    @killlog = character_kills_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @killlog}
    end
  end

  def employment
    @user = current_user
    @info = character_info_eve_api(@user,params[:id])
    @character = character_sheet_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @employment}
    end
  end

  def skills
    @user = current_user
    @info = character_info_eve_api(@user,params[:id])
    @character = character_sheet_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @employment}
    end
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
    begin
      #EAAL.cache = EAAL::Cache::MemcachedCache.new
      EAAL::API.new(user.apikey,user.secretkey)
    rescue EAAL::Exception::EveAPIException => e
      e
    end
  end
end
