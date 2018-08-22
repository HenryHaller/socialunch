class AddAddressToLunchRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :lunch_requests, :address, :string, null: false, default: "Yemen Road"
  end
end
