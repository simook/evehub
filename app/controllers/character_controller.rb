class CharacterController < ApplicationController
  def index
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.html {render :layout => 'hub'}
    end
  end

  def info
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @character}
    end
  end

  def killlog
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @character.killlogs, :root => false}
    end
  end

  def skills
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.html {render :layout => 'hub'}
      format.json {render :json => @character.character_skills, :root => false }
    end
  end

  def attributes
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.json {render :json => @character.character_attributes, :root => false}
    end
  end

  def certificates
    @character = current_user.characters.where(:character_id => current_user.primary_character_id).first
    respond_to do |format|
      format.json {render :json => @character.character_certificates, :root => false}
    end
  end

end
