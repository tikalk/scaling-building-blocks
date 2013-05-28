# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_products
  has_many :products, :through => :order_products
  
  attr_accessible :date, :quantity, :product_id, :user_id

  resourcify    # rolify
end
