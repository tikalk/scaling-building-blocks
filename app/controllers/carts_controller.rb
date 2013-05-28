class CartsController < ApplicationController
  def show
    @cart = current_cart
    # @cart_items = current_cart.cart_items.inject({}) do |hash, obj| 
    #   if !hash.has_key?(obj.product_id)  
    #   	hash[obj.product_id] = obj 
    #   else 
    #   	hash[obj.product_id].quantity = hash[obj.product_id].quantity + obj.quantity;  
    #   end
    #   hash
    # end
  end
end
