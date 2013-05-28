# == Schema Information
#
# Table name: order_products
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null
#  product_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessible :product_id, :order_id
end
