class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :active
      t.float :rate
      t.string :image
      t.string :classify
      t.references :category,foreign_key: true

      t.timestamps
    end
  end
end
