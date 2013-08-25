class AddJobPostingIdToJobApplications < ActiveRecord::Migration
  def change
    add_column :job_applications, :job_posting_id, :integer
    add_index :job_applications, :job_posting_id
  end
end
