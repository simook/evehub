class KilllogItem < ActiveRecord::Base
  belongs_to :killlog

  attr_accessible :flag, :killlog_id, :qty_destroyed, :qty_dropped, :singleton, :type_id
end
