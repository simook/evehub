class StarbaseDetail < ActiveRecord::Base
  belongs_to :starbase

  has_many :starbase_detail_settings
  has_many :starbase_detail_fuels
  has_many :starbase_detail_combat_settings

  attr_accessible :cached_until, :online_timestamp, :starbase_id, :state, :state_timestamp

  def active_model_serializer
    StarbaseDetailSerializer
  end
end
