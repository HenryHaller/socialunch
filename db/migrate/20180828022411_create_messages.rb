class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user
      t.references :lunch_date
      t.timestamps
    end
  end
end
