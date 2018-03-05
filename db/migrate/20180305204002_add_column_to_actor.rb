class AddColumnToActor < ActiveRecord::Migration[5.1]
  def change
    add_column :actors, :image, :string
  end
end
