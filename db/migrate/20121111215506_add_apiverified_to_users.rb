class AddApiverifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apiverified, :integer
  end
end
