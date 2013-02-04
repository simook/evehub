class CreateSubdomains < ActiveRecord::Migration
  def change
    create_table :subdomains do |t|
      t.string :name

      t.timestamps
    end

    create_table(:users_subdomains, :id => false) do |t|
      t.references :user
      t.references :subdomain
    end

    add_index(:subdomains, :name)
    add_index(:users_subdomains, [ :user_id, :subdomain_id ])
  end
end
