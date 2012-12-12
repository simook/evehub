class AddKilllogCachedUntilToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :killlog_cached_until, :datetime
  end
end
