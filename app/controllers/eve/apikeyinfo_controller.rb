class Eve::ApikeyinfoController < ApplicationController
  def index
    unless params[:key].nil? and params[:secret].nil?
      @json = verify_eve_api(params[:key],params[:secret])
    else
      @json = { :status => 'error', :msg => 'Missing EVE API ID and Verification Code' }
    end

    respond_to do |format|
     format.json { render json: @json }
    end
  end

  private
  def verify_eve_api(key,secret)
    begin
      accessmask = Eve.APIKeyInfo(key,secret)
    rescue EAAL::Exception::EveAPIException => e
      accessmask = {:status => 'error', :msg => e.message}
    end
  end
end