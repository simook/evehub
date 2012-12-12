class CharacterAttribute < ActiveRecord::Base
  belongs_to :character

  attr_accessible :name, :value, :character_id
end
