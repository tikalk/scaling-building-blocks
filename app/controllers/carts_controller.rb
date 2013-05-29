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

  def checkout
    # Use the TrustCommerce test servers
    ActiveMerchant::Billing::Base.mode = :test

    gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
                :login => 'TestMerchant',
                :password => 'password')

    # ActiveMerchant accepts all amounts as Integer values in cents
    amount = 1000  # $10.00

    # The card verification value is also known as CVV2, CVC2, or CID
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                    :first_name         => 'Bob',
                    :last_name          => 'Bobsen',
                    :number             => '4242424242424242',
                    :month              => '8',
                    :year               => Time.now.year+1,
                    :verification_value => '000')

    # Validating the card automatically detects the card type
    if credit_card.valid?
      # Capture $10 from the credit card
      response = gateway.purchase(amount, credit_card)

      if response.success?
        @response_message = "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
      else
        @response_message = response.message
      end
    end
  end
end
