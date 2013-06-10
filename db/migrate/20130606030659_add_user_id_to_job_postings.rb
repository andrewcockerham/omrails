class AddUserIdToJobPostings < ActiveRecord::Migration
  def change
    add_column :job_postings, :user_id, :integer
    add_index :job_postings, :user_id
  end
end
