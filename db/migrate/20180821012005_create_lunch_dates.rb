class CreateLunchDates < ActiveRecord::Migration[5.2]
  def change
    create_table :lunch_dates do |t|
      t.references :request1
      t.references :request2
      t.references :restaurant, foreign_key: true
      t.datetime :begin
      t.integer :suggested_duration
      t.string :lunch_type
      t.string :vicinity
      t.string :venue_name
      t.timestamps
    end
  end
end
