class CharacterSkillSerializer < ActiveModel::Serializer
  self.root = false
  attributes :type_id, :skillpoints, :level, :published, :updated_at
end
