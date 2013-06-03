class CreateProductsLikesTable < ActiveRecord::Migration
  def change
    create_table :product_likes do |t|
      t.integer :product_id, :null => false
      t.integer :like_id, :null => false

      t.timestamps
    end

    # add theses indexes so theoretically database queries are faster.
    add_index :product_likes, :like_id
    add_index :product_likes, :product_id
  end
end
