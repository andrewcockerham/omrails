class AddHirerBooleanToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hirer, :boolean
    add_index :users, :hirer
  end
end
