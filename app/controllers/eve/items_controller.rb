class Eve::ItemsController < ApplicationController
  def show
    cache = ActiveSupport::Cache::MemoryStore.new(:expires_in => 1.hour)

    if cache.fetch(params[:id]).nil?
      @item = Items.find(params[:id])
      cache.write(@item.id,@item.typeName)
    else
      @item = cache.fetch(params[:id])
    end

    respond_to do |format|
      format.json {render json: @item}
    end
  end

end
