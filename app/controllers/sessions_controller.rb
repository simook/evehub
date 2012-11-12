class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    if resource.apiverified.nil?
      @verify = verify_eve_api(resource.apikey,resource.secretkey)
      if @verify === true
        resource.apiverified = '1'
        resource.save
        respond_with resource, :location => after_sign_in_path_for(resource)
      elsif @verify === false
        flash[:alert] = "<h4>Your EVE API does not have full access.</h4>When creating your <a href='https://support.eveonline.com/api/Key/CreatePredefined/227488251' target='_blank'>EVE API key</a>, make sure the Access Mask has a value of at least 227488251.".html_safe
        redirect_to account_path
      else
        flash[:alert] = @verify
        redirect_to account_path
      end
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  protected
  def after_sign_in_invaid_api_path_for(resource)
    account_path
  end

  def after_sign_in_path_for(resource)
    corporation_index_path
  end

  private
  def verify_eve_api(key,secret)
    begin
      accessmask = Eve.APIKeyInfo(key,secret)
      accessmask >= '227488251'
    rescue EAAL::Exception::EveAPIException => e
      accessmask = "EVE API: #{e.message}"
    end
  end
end