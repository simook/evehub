class StarbaseList < ActiveRecord::Base
  attr_accessible :item_id, :location_id, :moon_id, :online_timestamp, :standing_owner_id, :state, :state_timestamp, :type_id
end
