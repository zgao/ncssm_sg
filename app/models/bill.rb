class Bill < ActiveRecord::Base
  attr_accessible :bill_id, :sponsors, :status, :title

  has_attached_file :bill_text
end
