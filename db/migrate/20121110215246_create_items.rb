class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :typeID
      t.string :typeName

      t.timestamps
    end
  end
end
