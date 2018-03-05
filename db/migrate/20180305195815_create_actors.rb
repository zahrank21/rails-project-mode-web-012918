class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :rating
      t.text :bio
      t.string :gender
      t.integer :age
      t.string :dob
      t.string :pob

      t.timestamps
    end
  end
end
