class CreateProductsReviewsTable < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.integer :product_id, :null => false
      t.integer :review_id, :null => false

      t.timestamps
    end

    # add theses indexes so theoretically database queries are faster.
    add_index :product_reviews, :review_id
    add_index :product_reviews, :product_id
  end
end
