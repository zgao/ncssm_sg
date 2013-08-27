class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :petition
      t.string :name
      t.string :hall
      t.string :comment

      t.timestamps
    end
    add_index :votes, :petition_id
  end
end
