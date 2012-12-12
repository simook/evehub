class StarbaseDetailCombatSetting < ActiveRecord::Base
  belongs_to :starbase_detail
  has_many :starbase_detail_combat_setting_attribs

  attr_accessible :name, :owner_id, :starbase_detail_id, :value
end
