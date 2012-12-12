class CreateStarbaseDetailCombatSettingAttribs < ActiveRecord::Migration
  def change
    create_table :starbase_detail_combat_setting_attribs do |t|
      t.integer :starbase_detail_combat_setting_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
