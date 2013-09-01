class AddAttachmentCertificatePdfToCertificates < ActiveRecord::Migration
  def self.up
    change_table :certificates do |t|
      t.attachment :certificate_pdf
    end
  end

  def self.down
    drop_attached_file :certificates, :certificate_pdf
  end
end
