class CreateStarbaseDetailFuels < ActiveRecord::Migration
  def change
    create_table :starbase_detail_fuels do |t|
      t.integer :starbase_detail_id
      t.integer :type_id
      t.integer :quantity

      t.timestamps
    end
  end
end
