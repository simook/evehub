class StarbaseDetailSetting < ActiveRecord::Base
  belongs_to :starbase_detail

  attr_accessible :starbase_detail_id, :name, :value

  def active_model_serializer
    StarbaseDetailSettingSerializer
  end
end
