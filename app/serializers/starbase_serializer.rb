class StarbaseSerializer < ActiveModel::Serializer
  self.root = false
  attributes :item_id, :type_id, :location_id, :moon_id, :state, :state_timestamp, :online_timestamp, :standing_owner_id, :updated_at

  has_one :starbase_detail, :key => :details
end
