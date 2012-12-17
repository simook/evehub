class Admin::CharacterController < ApplicationController
  def show
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
    end
  end

  def info
    authorize! :info, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:user_id])
    @character = character_sheet_eve_api(@user,params[:id])
    @info = character_info_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @character}
    end
  end

  def killlog
    authorize! :killlog, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:user_id])
    @character = character_sheet_eve_api(@user,params[:id])
    @info = character_info_eve_api(@user,params[:id])
    @killlog = character_kills_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @killlog}
    end
  end

  def employment
    authorize! :employment, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:user_id])
    @info = character_info_eve_api(@user,params[:id])
    @character = character_sheet_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @employment}
    end
  end

  def skills
    authorize! :skills, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:user_id])
    @info = character_info_eve_api(@user,params[:id])
    @character = character_sheet_eve_api(@user,params[:id])

    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render json: @employment}
    end
  end
end
