class StarbaseDetailCombatSettingSerializer < ActiveModel::Serializer
  attributes :name

  has_many :starbase_detail_combat_setting_attribs, :key => :attribs
end
