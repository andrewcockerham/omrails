class JobApplication < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  
  has_many	:job_experiences

  validates :user_id, presence: true

end
