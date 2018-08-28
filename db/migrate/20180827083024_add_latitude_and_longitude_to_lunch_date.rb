class AddLatitudeAndLongitudeToLunchDate < ActiveRecord::Migration[5.2]
  def change
    add_column :lunch_dates, :longitude, :float
    add_column :lunch_dates, :latitude, :float
  end
end
