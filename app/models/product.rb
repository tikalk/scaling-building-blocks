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
  include ProductLikes
  include ProductReviews

  has_many :order_products    # product_orders better name, but alphabetially here.
  has_many :orders, :through => :order_products

  has_many :product_likes
  has_many :likes, :through => :product_likes

  has_many :product_reviews
  has_many :reviews, :through => :product_reviews

  belongs_to :category

  attr_accessible :description, :name, :serves, :order_id, :price, 
    :image, :crop_x, :crop_y, :crop_w, :crop_h, :remove_image, :image_cache

  mount_uploader :image, ImageUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  
  def crop_image
    image.recreate_versions! if crop_x.present?
  end
end
