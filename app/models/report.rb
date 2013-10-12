class Report < ActiveRecord::Base
  attr_accessible :author, :report_id, :title, :bill, :report_text

  has_attached_file :report_text

  belongs_to :bill
end
