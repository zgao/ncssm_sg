class AddAttachmentBillTextToBills < ActiveRecord::Migration
  def self.up
    change_table :bills do |t|
      t.attachment :bill_text
    end
  end

  def self.down
    drop_attached_file :bills, :bill_text
  end
end
