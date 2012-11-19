class Corporations < ActiveRecord::Base
  has_many :users
  self.primary_key = 'corp_id'
  attr_accessible :alliance_id, :alliance_name, :ceo_name, :ceoid, :description, :corp_id, :member_count, :member_limit, :name, :shares, :station_id, :station_name, :tax_rate, :ticker, :url
end
