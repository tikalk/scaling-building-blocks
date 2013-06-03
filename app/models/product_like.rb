class ProductLike < ActiveRecord::Base
  belongs_to :like
  belongs_to :product

  attr_accessible :product_id, :like_id
end
