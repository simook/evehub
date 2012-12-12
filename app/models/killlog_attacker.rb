class KilllogAttacker < ActiveRecord::Base
  belongs_to :killlog

  attr_accessible :alliance_id, :alliance_name, :character_id, :character_name, :corporation_id, :corporation_name, :damage_done, :faction_id, :faction_name, :finaly_blow, :killlog_id, :security_status, :ship_type_id, :weapon_type_id
end
