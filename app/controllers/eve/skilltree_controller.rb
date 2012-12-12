class Eve::SkilltreeController < ApplicationController
  def index
    respond_to do |format|
      format.json {render json: skilltree}
    end
  end

  def skilltree
   xml = File.read('lib/eve/SkillTree.xml')
   hash = Hash.from_xml(xml)
   hash.to_json
 end
end
