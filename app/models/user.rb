class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :hirer, :job_experience_attributes
  # attr_accessible :title, :body

  validates_uniqueness_of :email
  
  has_many :pins, :dependent => :destroy
  has_many :job_postings, :dependent => :destroy
  has_many :job_applications, :dependent => :destroy
  has_one :job_experience, :dependent => :destroy

  accepts_nested_attributes_for :job_experience
end
