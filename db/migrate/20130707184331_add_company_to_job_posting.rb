class AddCompanyToJobPosting < ActiveRecord::Migration
  def change
    add_column :job_postings, :company, :string
    add_index :job_postings, :company
  end
end
