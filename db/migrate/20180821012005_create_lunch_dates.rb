class CreateLunchDates < ActiveRecord::Migration[5.2]
  def change
    create_table :lunch_dates do |t|
      t.references :user
      t.references :second_user
      t.references :restaurant, foreign_key: true
      t.datetime :begin
      t.integer :suggested_duration
      t.string :lunch_type

      t.timestamps
    end
  end
end
