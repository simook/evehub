class AddPrimaryCharacterIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :primary_character_id, :string
  end
end
