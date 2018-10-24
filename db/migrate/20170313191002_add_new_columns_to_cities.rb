class AddNewColumnsToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :latitude, :float
  end
end
