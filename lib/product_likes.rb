module ProductLikes

  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
  end

  module InstanceMethods
  # like a product (inc total likes and calculate average likeability)
    def like(likeability)
      @hash = Redis::HashKey.new(product_likes_key)
      @hash.incr('num_likes', 1)
      @hash.incr('likeability_sum', likeability)
    end
    
    # unlike a product (reduce total likes and update average likeability)
    def unlike(likeability)
      @hash = Redis::HashKey.new(product_likes_key)
      if number_of_likers > 0
        @hash.incr('num_likes', -1)
        @hash.incr('likeability_sum', -likeability)
      else
        @hash['num_likes'] = 0
        @hash['likeability_sum'] = 0
      end
    end

    def likeability_sum
      @hash = Redis::HashKey.new(product_likes_key)
      @hash['likeability_sum'].to_i
    end

    def number_of_likers
      @hash = Redis::HashKey.new(product_likes_key)
      @hash['num_likes'].to_i
    end

    def average_likeability
      if number_of_likers != 0
        likeability_sum / number_of_likers.to_f
      else
        0
      end
    end

    # Set - be careful. Only useful for migrations
    def set_number_of_likers(num)
      @hash = Redis::HashKey.new(product_likes_key)
      @hash['num_likes'] = num
    end

    def set_likeability_sum(num)
      @hash = Redis::HashKey.new(product_likes_key)
      @hash['likeability_sum'] = num
    end

    # helper method to generate redis keys
    def product_likes_key
      "product:#{self.id}:likes"
    end
  end

end