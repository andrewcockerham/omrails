class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable,
         :rememberable, :trackable, :validatable 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :hirer, :job_experience_attributes

  # Validations
  validates_uniqueness_of :email

  # Associations
  has_many :pins, :dependent => :destroy
  has_many :job_postings, :dependent => :destroy
  has_many :job_applications, :dependent => :destroy
  has_one :job_experience, :dependent => :destroy

  has_many :certificates

  # Nested Attributes
  accepts_nested_attributes_for :job_experience
   # :allow_destroy => true,
   # :reject_if     => :all_blank
end
