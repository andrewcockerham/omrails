class JobPosting < ActiveRecord::Base
  attr_accessible :description, :title

  belongs_to :user
  has_many :job_applications

  validates :description, presence: true, :length => { :maximum => 1000 }
  validates :title, presence: true
  validates :user_id, presence: true

  #validates @job.user.hirer = true
	#with_options :if => :is_hirer? do |hirer|
   # hirer.validates :password, :length => { :minimum => 10 }
    #hirer.validates :email, :presence => true
  #end

  #validates :hirer, :inclusion => { :in => [true, false] }
  #validates :hirer, presence: true #(user.hirer = true)
end
