class AddUserIdToJobExperience < ActiveRecord::Migration
  def change
    add_column :job_experiences, :user_id, :integer
    add_index :job_experiences, :user_id
  end
end
