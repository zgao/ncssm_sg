class Bill < ActiveRecord::Base
  attr_accessible :bill_id, :sponsors, :status, :title, :summary, :bill_text

  has_attached_file :bill_text,
    storage: :google_drive,
    google_drive_credentials: "#{Rails.root}/config/google_drive.yml"

  has_many :reports
end
