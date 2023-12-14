class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.string :category
      t.string :title
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
