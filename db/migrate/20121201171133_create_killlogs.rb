class CreateKilllogs < ActiveRecord::Migration
  def change
    create_table :killlogs do |t|
      t.references :character
      t.integer :kill_id
      t.integer :solar_system_id
      t.datetime :kill_time
      t.integer :moon_id

      t.timestamps
    end
  end
end
