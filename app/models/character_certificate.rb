class CharacterCertificate < ActiveRecord::Base
  belongs_to :character

  attr_accessible :certificate_id, :character_id
end
