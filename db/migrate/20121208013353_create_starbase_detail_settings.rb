class CreateStarbaseDetailSettings < ActiveRecord::Migration
  def change
    create_table :starbase_detail_settings do |t|
      t.integer :starbase_detail_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
