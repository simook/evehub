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
    apikey = resource.apikey
    apisecret = resource.secretkey

    if verify_eve_api(apikey,apisecret)
      # if verify_eve_api is true
    else
      # if verify_eve_api is false
      flash[:alert] = "Your EVE API does not have full access."
      render "new"
    end
  end

  private
  def verify_eve_api(key,secret)
    begin
      accessmask = EAAL::API.new(key,secret).APIKeyInfo
    rescue EAAL::Exception::EveAPIException => e
      #EAAL::Exception::EveAPIException
      flash[:alert] = "Step 2: #{e.message}"
      render "new"
    else
      false
    end
  end
end