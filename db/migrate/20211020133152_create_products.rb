class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :product_type
      t.text :description
      t.string :filename
      t.integer :height, null: false
      t.integer :width, null: false
      t.float :price, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
