class AddJobExperienceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :job_experience_id, :integer
    add_index :users, :job_experience_id
  end
end
