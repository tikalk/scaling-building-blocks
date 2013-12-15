# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  serves      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  price       :integer
#  image       :string(255)
#

class Product < ActiveRecord::Base
  has_many :order_products    # product_orders better name, but alphabetially here.
  has_many :orders, :through => :order_products

  has_many :likes
  has_many :reviews

  belongs_to :category
  has_many :cart_items

  searchable do
    text :name
    integer :price
    text(:name_text, as: :name_text) { name }
  end

  attr_accessible :description, :name, :serves, :order_id, :price, 
    :image, :crop_x, :crop_y, :crop_w, :crop_h, :remove_image, :image_cache
end
