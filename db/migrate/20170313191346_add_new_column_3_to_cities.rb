class AddNewColumn3ToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :gmaps, :boolean
  end
end
