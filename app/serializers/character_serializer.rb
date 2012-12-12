class CharacterSerializer < ActiveModel::Serializer
  self.root = false
  attributes :character_id, :name, :dob, :race, :bloodline, :ancestry, :gender, :corporation_name, :corporation_id, :alliance_name, :alliance_id, :clone_name, :clone_skill_points, :balance, :updated_at, :killlog_cached_until
end
