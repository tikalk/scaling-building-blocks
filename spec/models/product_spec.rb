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
  it "can be instantiated" do
    Product.new.should be_an_instance_of(Product)
  end

  it "can be saved successfully" do
    Product.create.should be_persisted
  end

  # it "can't be deleted" do 
  # 	let { FactoryGirl.create(:product) }
  # 	expect { delete product_path(admin) }.not_to change(Product, :count) 
  # end
end

