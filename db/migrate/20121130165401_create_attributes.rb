class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :character_attributes do |t|
      t.references :character
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
