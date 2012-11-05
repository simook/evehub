class RegistrationsController < Devise::RegistrationsController
  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    email_changed = @user.email != params[:user][:email]
    password_changed = !params[:user][:password].empty?

    successfully_updated = if email_changed or password_changed
      @user.update_with_password(params[:user])
    else
      @user.update_without_password(params[:user])
    end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_registration_path, :notice => "Your account has been updated"
    else
      render "edit"
    end
  end

  def create
    build_resource
    apikey = params[:user][:apikey]
    apisecret = params[:user][:secretkey]

    if verify_eve_api(apikey,apisecret)

    else
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
  end

  private
  def verify_eve_api(key,secret)
    accessmask = EAAL::API.new(key,secret).APIKeyInfo.key.to_json
    puts accessmask
  end
end