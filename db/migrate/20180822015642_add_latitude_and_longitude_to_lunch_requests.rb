class AddLatitudeAndLongitudeToLunchRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lunch_requests, :latitude, :float, null: false, default: 0.0
    add_column :lunch_requests, :longitude, :float, null: false, default: 0.0
  end
end
