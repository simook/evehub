class Eve::CertificatetreeController < ApplicationController
  def index
    begin
      EAAL.cache = EAAL::Cache::FileCache.new
      api = EAAL::API.new('','')
      api.scope = "eve"
      @CertificateTree = api.CertificateTree()
    rescue EAAL::Exception::EveAPIException => e
      @CertificateTree = e.message
    end

    respond_to do |format|
      format.json {render json: @CertificateTree}
    end
  end
end
