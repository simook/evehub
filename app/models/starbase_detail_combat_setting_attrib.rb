class StarbaseDetailCombatSettingAttrib < ActiveRecord::Base
  belongs_to :starbase_detail_combat_setting

  attr_accessible :name, :starbase_detail_combat_setting_id, :value

  def active_model_serializer
    StarbaseDetailCombatSettingAttribSerializer
  end
end
