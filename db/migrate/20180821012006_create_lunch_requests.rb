class CreateLunchRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :lunch_requests do |t|
      t.datetime :datetime
      t.integer :suggested_duration
      t.string :lunch_type
      t.references :user
      t.references :lunch_date
      t.integer :score_increase, default: 0

      t.timestamps
    end
  end
end
