class CharacterAttributeSerializer < ActiveModel::Serializer
  self.root = false
  attributes :name, :value, :updated_at
end
