class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.string :sponsors
      t.string :status
      t.string :bill_id

      t.timestamps
    end
  end
end
