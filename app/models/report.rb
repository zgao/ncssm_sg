class Report < ActiveRecord::Base
  attr_accessible :author, :report_id, :title, :bill, :report_text

  has_attached_file :report_text,
    storage: :google_drive,
    google_drive_credentials: "#{Rails.root}/config/google_drive.yml",
    google_drive_options: {
      public_folder_id: '0B4L2wG1YZ3wda3Z0enRJZHkxaW8'
    }

  belongs_to :bill

  validates_uniqueness_of :report_id
end
