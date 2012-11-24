class AccountBalance < ActiveRecord::Base
  attr_accessible :account_id, :account_key, :balance, :cached_until, :user_id
end
