# == Schema Information
#
# Table name: product_reviews
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  review_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductReview < ActiveRecord::Base
  belongs_to :review
  belongs_to :product

  attr_accessible :product_id, :review_id
end
