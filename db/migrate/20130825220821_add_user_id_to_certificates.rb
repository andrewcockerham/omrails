class AddUserIdToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :user_id, :integer
    add_index :certificates, :user_id
  end
end
