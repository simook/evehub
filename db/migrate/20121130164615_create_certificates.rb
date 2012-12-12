class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :character_certificates do |t|
      t.references :character
      t.integer :certificate_id

      t.timestamps
    end
  end
end
