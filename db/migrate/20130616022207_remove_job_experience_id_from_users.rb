class RemoveJobExperienceIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :job_experience_id
  end

  def down
    add_column :users, :job_experience_id, :integer
  end
end
