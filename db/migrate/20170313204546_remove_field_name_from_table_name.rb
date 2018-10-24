class RemoveFieldNameFromTableName < ActiveRecord::Migration[5.0]
  def change
    remove_column :cities, :gmaps, :boolean 
 end

end
