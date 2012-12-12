class StarbaseDetailSerializer < ActiveModel::Serializer
  attributes :state, :state_timestamp, :online_timestamp, :updated_at

  has_many :starbase_detail_settings, :key => :settings
  has_many :starbase_detail_fuels, :key => :fuel
  has_many :starbase_detail_combat_settings, :key => :combat_settings
end
