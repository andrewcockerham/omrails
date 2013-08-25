class JobApplication < ActiveRecord::Base
  attr_accessible :job_posting_id
  belongs_to :user
  belongs_to :job_posting
  
  has_many	:job_experiences

  validates :user_id, presence: true

end
