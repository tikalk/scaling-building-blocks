class CheckoutWorker
  include Sidekiq::Worker

  def perform(cart_id)
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

      cart = Cart.find(cart_id)

      if response.success?
        @response_message = "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
        # let's dump the message to the token
        cart.token = @response_message
        pp 'success'
      else
        cart.token = response.message
        pp 'failure'
      end

      cart.save!
    end

    #### Update account balance and perform other calculations 
    sleep 2

    #### Send email notification
    sleep 2
  end
end