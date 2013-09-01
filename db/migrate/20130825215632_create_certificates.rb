class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.string :institution
      t.date :date_completed

      t.timestamps
    end
    add_index :certificates, :institution
  end
end
