class CorporationAccountBalance < ActiveRecord::Base
  belongs_to :corporation

  attr_accessible :account_id, :account_key, :balance, :cached_until, :corporation_id
end
