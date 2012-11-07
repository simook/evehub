module CharacterHelper
  def id_to_name(id)
    EAAL.cache = EAAL::Cache::FileCache.new
    api = EAAL::API.new('','')
    api.scope = "eve"
    api.CharacterName(:ids=>id).characters.first.name
    #id
  end
end
