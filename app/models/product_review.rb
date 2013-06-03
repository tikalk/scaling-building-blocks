class ProductReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :product

  attr_accessible :product_id, :review_id
end
