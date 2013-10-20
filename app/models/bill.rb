class Bill < ActiveRecord::Base
  attr_accessible :bill_id, :sponsors, :status, :title, :summary, :bill_text

  has_attached_file :bill_text,
    storage: :google_drive,
    google_drive_credentials: "#{Rails.root}/config/google_drive.yml",
    google_drive_options: {
      public_folder_id: '0B4L2wG1YZ3wda3Z0enRJZHkxaW8'
    }

  has_many :reports

  validates_uniqueness_of :bill_id
end
