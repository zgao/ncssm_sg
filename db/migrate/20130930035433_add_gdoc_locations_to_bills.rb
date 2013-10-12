class AddGdocLocationsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :gdoc_location, :string
  end
end
