class KilllogVictim < ActiveRecord::Base
  belongs_to :killlog

  attr_accessible :alliance_id, :alliance_name, :character_id, :character_name, :corporation_id, :corporation_name, :damage_taken, :faction_name, :factoin_id, :killlog_id, :ship_type_id
end
