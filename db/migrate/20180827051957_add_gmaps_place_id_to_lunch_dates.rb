class AddGmapsPlaceIdToLunchDates < ActiveRecord::Migration[5.2]
  def change
    add_column :lunch_dates, :gmaps_place_id, :string
  end
end
