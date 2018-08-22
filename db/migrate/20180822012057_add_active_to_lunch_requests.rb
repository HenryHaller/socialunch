class AddActiveToLunchRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lunch_requests, :active, :boolean, null: false, default: true
  end
end
