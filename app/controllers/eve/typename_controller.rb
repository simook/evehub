class Eve::TypenameController < ApplicationController
  def show
    respond_to do |format|
      format.json {render json: type_id_to_name(params[:id])}
    end
  end

  def type_id_to_name(id)
    begin
      EAAL.cache = EAAL::Cache::FileCache.new
      api = EAAL::API.new('','')
      api.scope = "eve"
      api.TypeName(:ids=>id).types.first.typeName
    rescue EAAL::Exception::EveAPIException => e
      flash[:error] = "#{e.message}"
    end
  end
end
