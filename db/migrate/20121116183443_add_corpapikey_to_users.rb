class AddCorpapikeyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :corp_apikey, :string
  end
end
