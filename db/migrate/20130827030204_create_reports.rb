class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :bill
      t.string :report_id
      t.string :author
      t.string :title

      t.timestamps
    end
    add_index :reports, :bill_id
  end
end
