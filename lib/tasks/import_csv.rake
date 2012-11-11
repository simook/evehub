namespace :import do
  desc "Import EVE Inventory Items"
  task items: :environment do
    require 'csv'

    headers = [
      "typeID",
      "typeName",
    ]

    CSV.foreach("lib/eve/invTypes.csv", {headers: :first_row}) do |row|
      sql_keys = []
      sql_vals = []

      created_at = Time.now.strftime("%Y-%m-%d %H:%M:%S")

      headers.each_with_index do |key, idx|
        val = row[idx]

        sql_keys << key
        sql_vals << ActiveRecord::Base.connection.quote(val)
      end

      sql = "
        INSERT INTO items (#{sql_keys.join(', ')}, created_at, updated_at)
        VALUES (#{sql_vals.join(', ')}, '#{created_at}', '#{created_at}')
      "

      res = ActiveRecord::Base.connection.execute(sql)

    end
  end
end