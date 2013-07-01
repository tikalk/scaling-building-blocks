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

require 'spec_helper'

describe Product do

  before(:each) do
    @product = Product.new
    @product2 = Product.new
  end

  it "should store likes" do
    10.times do |i|
      @product.likes << Like.new(:likeability => i)
      @product2.likes << Like.new(:likeability => i+10)
    end
    @product.save!
    @product2.save!

    # check product1 
    @product.likes.count.should equal 10
    @product.likes.each_with_index do |like, index|
      expect(like.likeability).to eq(index)
    end

    # check product2
    @product2.likes.count.should equal 10
    @product2.likes.each_with_index do |like, index|
      expect(like.likeability).to eq(index+10)
    end
  end

  it "should store reviews" do
    10.times do |i|
      @product.reviews << Review.new(:description => 'Lorem ipsum dolor sit amet')
      @product2.reviews << Review.new(:description => 'Lorem ipsum dolor sit amet' + i.to_s)
    end
    @product.save!
    @product2.save!

    # check product 1
    @product.reviews.count.should equal 10
    @product.reviews.each_with_index do |review, index|
      expect(review.description).to eq('Lorem ipsum dolor sit amet')
    end

    # check product2
    @product2.reviews.count.should equal 10
    @product2.reviews.each_with_index do |review, index|
      expect(review.description).to eq('Lorem ipsum dolor sit amet' + index.to_s)
    end
  end

  it "can be instantiated" do
    @product.should be_an_instance_of(Product)
  end

  it "can be saved successfully" do
    Product.create.should be_persisted
  end

  # it "can't be deleted" do 
  # 	let { FactoryGirl.create(:product) }
  # 	expect { delete product_path(admin) }.not_to change(Product, :count) 
  # end
end

