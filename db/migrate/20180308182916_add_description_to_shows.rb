class AddDescriptionToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :description, :text
  end
end
