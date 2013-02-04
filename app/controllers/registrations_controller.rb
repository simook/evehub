class RegistrationsController < Devise::RegistrationsController
  def edit
    render :layout => 'hub'
    @user = current_user
  end

  def api
    @user = current_user
    @issue = @user.apiverified.nil? or @user.primary_character_id.nil?
    render :layout => false
  end

  def corpapi
    @user = current_user
    render :layout => false
  end

  def corpid
    @user = current_user
    render :layout => false
  end

  def almostdone
  end

  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].nil?

    successfully_updated = if email_changed or password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to account_path, :notice => "Your account has been updated"
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def create
    build_resource
    plan = params[:plan]

    #apikey = resource.apikey
    #apisecret = resource.secretkey
    #@verify = verify_eve_api(apikey,apisecret)
    #if @verify === true
    #  resource.apiverified = '1'
    #  if resource.save
    #    if resource.active_for_authentication?
    #      set_flash_message :notice, :signed_up if is_navigational_format?
    #      sign_up(resource_name, resource)
    #      respond_with resource, :location => after_sign_up_path_for(resource)
    #    else
    #      set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
    #      expire_session_data_after_sign_in!
    #      respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    #    end
    #  else
    #    clean_up_passwords resource
    #    respond_with resource
    #  end
    #elsif @verify === false
    #  flash[:alert] = "<h4>Your EVE API does not have full access.</h4>When creating your <a href='https://support.eveonline.com/api/Key/CreatePredefined/227488251' target='_blank'>EVE API key</a>, make sure the Access Mask has a value of at least 227488251.".html_safe
    #  render "new"
    #else
    #  flash[:alert] = "<h4>EVE API</h4> #{@verify}".html_safe
    #  render "new"
    #end

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected
    def after_inactive_sign_up_path_for(resource)
      register_almostdone_path
    end

    def after_sign_up_path_for(resource)
      root_path
    end

  private
  def verify_eve_api(key,secret)
    begin
      response = Eve.APIKeyInfo(key,secret)
      response['accessmask'] >= '227488251'
    rescue EAAL::Exception::EveAPIException => e
      response = "#{e.message}"
    end
  end
end