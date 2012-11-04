class AddApisecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :secretkey, :string
  end
end
