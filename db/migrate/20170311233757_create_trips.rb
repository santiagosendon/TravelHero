class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :city_id
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
