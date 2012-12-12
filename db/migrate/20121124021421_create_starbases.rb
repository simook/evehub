class CreateStarbases < ActiveRecord::Migration
  def change
    create_table :starbases do |t|
      t.integer :item_id
      t.integer :type_id
      t.integer :location_id
      t.integer :moon_id
      t.integer :state
      t.date :state_timestamp
      t.date :online_timestamp
      t.integer :standing_owner_id
      t.datetime :cached_until
      t.integer :corporation_id

      t.timestamps
    end
  end
end
