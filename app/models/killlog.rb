class Killlog < ActiveRecord::Base
  has_many :killlog_attackers
  has_many :killlog_victims
  has_many :killlog_items
  belongs_to :character

  attr_accessible :character_id, :kill_id, :kill_time, :moon_id, :solar_system_id, :cached_until

end
