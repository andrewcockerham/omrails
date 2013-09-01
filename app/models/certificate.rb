class Certificate < ActiveRecord::Base
  attr_accessible :date_completed, :institution, :name, :certificate_pdf, :user_id

  validates :institution, presence: true
  validates :user_id, presence: true
  validates_attachment :certificate_pdf, presence: true, 
  														 content_type: { content_type: "application/pdf" },
  														 size: { less_than: 10.megabytes }
  belongs_to :user
  has_attached_file :certificate_pdf #, :styles => { :thumb => ["50x50#", :png] }
end
