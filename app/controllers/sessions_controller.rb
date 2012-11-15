class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if resource.apiverified.nil? or resource.primary_character_id.nil?
      #redirect_to api_path
      respond_with resource, :location => after_sign_in_eveapi_for(resource)
    else
      respond_with resource, :location => after_sign_in_path_for(resource)
    end
  end

  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        head :no_content
      end
    end
  end

  protected
  def after_sign_in_eveapi_for(resource)
    api_path
  end

  def after_sign_in_path_for(resource)
    corporation_index_path
  end
end