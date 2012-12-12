class Starbase < ActiveRecord::Base
  belongs_to :corporation

  has_one :starbase_detail
  has_many :starbase_detail_fuels, :through => :starbase_detail
  has_many :starbase_detail_settings, :through => :starbase_detail
  has_many :starbase_detail_combat_settings, :through => :starbase_detail

  attr_accessible :item_id, :location_id, :moon_id, :online_timestamp, :standing_owner_id, :state, :state_timestamp, :type_id, :corporation_id

  def active_model_serializer
    StarbaseSerializer
  end
end
