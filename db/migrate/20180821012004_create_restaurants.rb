class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :name
      t.text :description
      t.string :cuisine
      t.string :phone_number

      t.timestamps
    end
  end
end
