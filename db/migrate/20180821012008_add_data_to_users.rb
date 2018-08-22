class AddDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :integer
    add_column :users, :smoking, :boolean
    add_column :users, :bio, :text
  end
end
