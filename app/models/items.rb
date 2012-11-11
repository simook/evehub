class Items < ActiveRecord::Base
  #set_primary_key :typeID
  self.primary_key = 'typeID'
  attr_accessible :typeID, :typeName
end
