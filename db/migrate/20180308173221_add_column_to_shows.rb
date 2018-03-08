class AddColumnToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :ratings, :string
  end
end
