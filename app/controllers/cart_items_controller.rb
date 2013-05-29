class CartItemsController < ApplicationController
  def create
  	item = current_cart.cart_items.detect {|o| o.product_id == params[:cart_item]["product_id"].to_i}
  	if item.nil?
  		current_cart.cart_items.create!(params[:cart_item])
  	else
  		item.quantity += 1
  		item.save!
    end
    flash[:notice] = "Product added to cart"
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to current_cart_url
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to current_cart_url }
      format.json { head :no_content }
    end
  end
end
