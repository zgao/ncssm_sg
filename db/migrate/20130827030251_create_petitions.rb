class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.string :body
      t.integer :threshold

      t.timestamps
    end
  end
end
