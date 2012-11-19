class CreateCorporations < ActiveRecord::Migration
  def change
    create_table :corporations do |t|
      t.integer :corp_id
      t.string :name
      t.string :ticker
      t.integer :ceoid
      t.string :ceo_name
      t.integer :station_id
      t.string :station_name
      t.text :description
      t.string :url
      t.integer :alliance_id
      t.string :alliance_name
      t.string :tax_rate
      t.integer :member_count
      t.integer :member_limit
      t.integer :shares

      t.timestamps
    end
  end
end
