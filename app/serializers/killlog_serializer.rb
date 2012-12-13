class KilllogSerializer < ActiveModel::Serializer
  attributes :kill_id, :solar_system_id, :kill_time, :moon_id

  has_many :killlog_victims
  has_many :killlog_attackers
  has_many :killlog_items
end
