class AddUserIdToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :user_id, :integer
    add_index :job_applications, :user_id
  end
end
