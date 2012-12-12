class KilllogSerializer < ActiveModel::Serializer
  attributes :kill_id, :solar_system_id, :kill_time, :moon_id

  has_many :victims
  has_many :attackers
  has_many :items
end
