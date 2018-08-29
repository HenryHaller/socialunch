class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo_reference
      t.string :photo_url
      t.references :lunch_date, foreign_key: true
      t.string :html_attribution

      t.timestamps
    end
  end
end
