class Report < ActiveRecord::Base
  belongs_to :bill
  attr_accessible :author, :report_id, :title

  has_attached_file :report_text
end
