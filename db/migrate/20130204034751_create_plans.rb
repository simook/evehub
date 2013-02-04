class CreatePlans < ActiveRecord::Migration
  def change
    create_table(:plans) do |t|
      t.string :name
      t.integer :user_limit
      t.integer :price

      t.timestamps
    end

    create_table(:users_plans, :id => false) do |t|
      t.references :user
      t.references :plan
    end

    add_index(:plans, :name)
    add_index(:users_plans, [ :user_id, :plan_id ])
  end
end
