class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :order_id, :null => false
      t.integer :product_id, :null => false

      t.timestamps
    end

    # add theses indexes so theoretically database queries are faster.
    add_index :order_products, :order_id
    add_index :order_products, :product_id
  end
end
