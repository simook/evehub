class Corporation < ActiveRecord::Base
  belongs_to :user

  has_many :starbases
  has_many :corporation_account_balances

  attr_accessible :alliance_id, :alliance_name, :ceo_name, :ceoid, :description, :corp_id, :member_count, :member_limit, :name, :shares, :station_id, :station_name, :tax_rate, :ticker, :url
end
