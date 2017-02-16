class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :total
      t.float :subtotal
      t.integer :status
      t.references :user, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
