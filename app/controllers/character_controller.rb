class CharacterController < ApplicationController
  def index
    redirect_to :action => 'info'
  end

  def info
    if current_user.character
      @info = current_user.character
    else
      @info = false
    end
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @info}
    end
  end

  def killlog
    if current_user.character
      @killlogs = current_user.character.killlogs
    else
      @killlogs = false
    end
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @killlogs, :root => false}
    end
  end

  def skills
    if current_user.character
      @skills = current_user.character.character_skills
    else
      @skills = false
    end
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @skills, :root => false }
    end
  end

  def attributes
    if current_user.character
      @attributes = current_user.character.character_attributes
    else
      @attributes = false
    end
    respond_to do |format|
      format.json {render :json => @attributes, :root => false}
    end
  end

  def certificates
    if current_user.character
      @certificates = current_user.character.character_certificates
    else
      @certificates = false
    end
    respond_to do |format|
      format.json {render :json => @certificates, :root => false}
    end
  end

end
