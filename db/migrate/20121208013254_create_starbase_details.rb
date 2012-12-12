class CreateStarbaseDetails < ActiveRecord::Migration
  def change
    create_table :starbase_details do |t|
      t.datetime :cached_until
      t.integer :starbase_id
      t.integer :state
      t.datetime :state_timestamp
      t.datetime :online_timestamp

      t.timestamps
    end
  end
end
