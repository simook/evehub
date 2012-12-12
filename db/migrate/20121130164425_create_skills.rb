class CreateSkills < ActiveRecord::Migration
  def change
    create_table :character_skills do |t|
      t.references :character
      t.integer :type_id
      t.decimal :skillpoints
      t.integer :level
      t.integer :published

      t.timestamps
    end
  end
end
