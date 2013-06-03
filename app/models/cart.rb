# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items
  has_many :products, :through => :cart_items

  attr_accessible :user_id
  
  def total_price
    cart_items.to_a.sum(&:full_price)
  end
end
