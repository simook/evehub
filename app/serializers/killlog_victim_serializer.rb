class KilllogVictimSerializer < ActiveModel::Serializer
  attributes :alliance_id, :alliance_name, :character_name, :corporation_name, :damage_taken, :faction_name, :ship_type_id
end
