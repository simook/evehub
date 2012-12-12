class CreateItems < ActiveRecord::Migration
  def change
    create_table :killlog_items do |t|
      t.references :killlog
      t.integer :flag
      t.integer :qty_dropped
      t.integer :qty_destroyed
      t.integer :type_id
      t.integer :singleton

      t.timestamps
    end
  end
end
