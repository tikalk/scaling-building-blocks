# == Schema Information
#
# Table name: product_likes
#
#  id         :integer          not null, primary key
#  product_id :integer          not null
#  like_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductLike < ActiveRecord::Base
  belongs_to :like
  belongs_to :product

  attr_accessible :product_id, :like_id
end
