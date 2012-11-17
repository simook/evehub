class Eve::StatusController < ApplicationController
  def index
    begin
      api = EAAL::API.new('','')
      api.scope = "server"
      @status = api.ServerStatus()
    rescue EAAL::Exception::EveAPIException => e
      @status = e.message
    end

    respond_to do |format|
      format.json {render json: @status}
    end
  end
end
