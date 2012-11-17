class AddCorpapisecretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :corp_apisecret, :string
  end
end
