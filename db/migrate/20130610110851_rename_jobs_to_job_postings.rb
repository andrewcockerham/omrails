class RenameJobsToJobPostings < ActiveRecord::Migration
  def self.up
	  rename_table :jobs, :job_postings
  end

  def self.down
	  rename_table :job_postings, :jobs
  end
end