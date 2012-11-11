class Eve::SkilltreeController < ApplicationController
  def index
    begin
      EAAL.cache = EAAL::Cache::FileCache.new
      api = EAAL::API.new('','')
      api.scope = "eve"
      @SkillTree = api.SkillTree()
    rescue EAAL::Exception::EveAPIException => e
      @SkillTree = e.message
    end

    respond_to do |format|
      format.json {render json: @SkillTree}
    end
  end
end
