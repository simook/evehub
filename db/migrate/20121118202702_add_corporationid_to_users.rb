class AddCorporationidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :corporation_id, :string
  end
end
