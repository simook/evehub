class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.references :user
      t.integer :character_id
      t.string :name
      t.date :dob
      t.string :race
      t.string :bloodline
      t.string :ancestry
      t.string :gender
      t.string :corporation_name
      t.integer :corporation_id
      t.string :alliance_name
      t.integer :alliance_id
      t.string :clone_name
      t.integer :clone_skill_points
      t.decimal :balance

      t.datetime :cached_until
      t.timestamps
    end
  end
end
