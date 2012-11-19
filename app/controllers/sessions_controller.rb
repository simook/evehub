class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    if resource.apiverified.nil? or resource.primary_character_id.nil?
      respond_with resource, :location => after_sign_in_eveapi_for(resource)
    elsif resource.corporation_id.nil? or resource.corporation_id.empty?
      debugger
      api = init_eve_api
      api.scope = 'eve'
      resource.corporation_id = api.CharacterInfo(:characterID => resource.primary_character_id).corporationID
      if resource.save
        respond_with resource, :location => after_sign_in_path_for(resource)
      end
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

  def after_sign_in_corpid_for(resource)
    corp_id_path
  end

  def after_sign_in_path_for(resource)
    corporation_index_path
  end

  def init_eve_api
    begin
      EAAL::API.new('','')
    rescue EAAL::Exception::EveAPIException => e
      e
    end
  end
end