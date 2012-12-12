class CharacterCertificateSerializer < ActiveModel::Serializer
  self.root = false
  attributes :certificate_id, :updated_at
end
