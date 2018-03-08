class ChangeActorsRatingDataTypeToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :actors, :rating, :float
  end

end
