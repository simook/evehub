class KilllogItemSerializer < ActiveModel::Serializer
  attributes :flag, :qty_dropped, :qty_destroyed, :type_id, :singleton
end
