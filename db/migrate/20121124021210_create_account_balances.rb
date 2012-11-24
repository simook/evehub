class CreateAccountBalances < ActiveRecord::Migration
  def change
    create_table :account_balances do |t|
      t.integer :account_id
      t.integer :account_key
      t.decimal :balance
      t.date :cached_until
      t.integer :user_id

      t.timestamps
    end
  end
end
