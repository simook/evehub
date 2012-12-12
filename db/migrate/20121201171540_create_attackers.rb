class CreateAttackers < ActiveRecord::Migration
  def change
    create_table :killlog_attackers do |t|
      t.references :killlog
      t.integer :alliance_id
      t.string :alliance_name
      t.integer :character_id
      t.string :character_name
      t.integer :corporation_id
      t.string :corporation_name
      t.integer :damage_done
      t.integer :faction_id
      t.string :faction_name
      t.boolean :final_blow
      t.float :security_status
      t.integer :ship_type_id
      t.integer :weapon_type_id

      t.timestamps
    end
  end
end
