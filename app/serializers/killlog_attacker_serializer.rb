class KilllogAttackerSerializer < ActiveModel::Serializer
  attributes :alliance_name, :character_name, :character_id, :corporation_name, :faction_name, :damage_done, :final_blow, :security_status, :ship_type_id, :weapon_type_id
end
