class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.text :characters
      t.text :cast
      t.string :title
      t.string :streamed_on
      t.string :status
      t.string :genres
      t.integer :episodes_ordered
      t.string :created_by
      t.float :rating

      t.timestamps
    end
  end
end
