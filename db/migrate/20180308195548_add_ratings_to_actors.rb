class AddRatingsToActors < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :ratings, :string
  end
end
