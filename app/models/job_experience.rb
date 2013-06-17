class JobExperience < ActiveRecord::Base
  attr_accessible :company, :description, :job_title, :start_date, :user_id

  belongs_to :user

  #validates :user_id, presence: true
end
