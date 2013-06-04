module ProductReviews

  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
  end

  module InstanceMethods
    def number_of_reviews
      @hash = Redis::HashKey.new(product_reviews_key)
      @hash['num_reviews'].to_i
    end

    # Set - be careful. Only useful for migrations
    def set_number_of_reviews(num)
      @hash = Redis::HashKey.new(product_reviews_key)
      @hash['num_reviews'] = num
    end

    # helper method to generate redis keys
    def product_reviews_key
      "product:#{self.id}:reviews"
    end
  end

end