class StarbaseDetailFuel < ActiveRecord::Base
  belongs_to :starbase_detail

  attr_accessible :starbase_detail_id, :quantity, :type_id
end
