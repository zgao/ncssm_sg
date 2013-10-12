class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.references :petition
      t.string :name
      t.string :hall
      t.string :comment

      t.timestamps
    end
    add_index :signatures, :petition_id
  end
end
