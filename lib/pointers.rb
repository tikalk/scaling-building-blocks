module Pointers

  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
  end

  module InstanceMethods
  # like a instance
    def like(instance)
      $redis.sadd(self.redis_key(pointed_by_me(instance)), instance.id)
      $redis.sadd(self.redis_key(pointing_to_me(instance)), self.id)
    end
    
    # unlike a instance
    def unlike(instance)
      $redis.srem(self.redis_key(pointed_by_me(instance)), instance.id)
      $redis.srem(self.redis_key(pointing_to_me(instance)), self.id)
    end
    
    # instances that like themselves
    def self_likers(instance)
      instance_ids = $redis.smembers(self.redis_key(pointing_to_me(instance)))
      self.class.name.constantize.where(:id => instance_ids)
    end

    # instances that like self
    # @TODO: change from instance to Model and in the other methods which use .where(...)
    def liking(instance)
      instance_ids = $redis.smembers(self.redis_key(pointed_by_me(instance)))
      instance.class.name.constantize.where(:id => instance_ids)
    end

    # instances who like and are being liked by self
    def mutually_liked(instance)
      instance_ids = $redis.sinter(self.redis_key(pointed_by_me(instance)), self.redis_key(pointing_to_me(instance)))
      self.class.name.constantize.where(:id => instance_ids)
    end

    # does the instance like self
    def liked_by?(instance)
      $redis.sismember(self.redis_key(pointing_to_me(instance)), instance.id)
    end
    
    # does self like instance
    def liking?(instance)
      $redis.sismember(self.redis_key(pointed_by_me(instance)), instance.id)
    end

    # number of likers
    def likers_count(instance)
      $redis.scard(self.redis_key(pointing_to_me(instance)))
    end

    # number of instances being liked
    def liking_count(instance)
      $redis.scard(self.redis_key(pointed_by_me(instance)))
    end
    
    # helper method to generate redis keys
    def redis_key(str)
      "instance:#{self.id}:#{str}"
    end

    def pointed_by_me(other_obj)
    	'#{self.class_name.downcase}-to-#{other_obj.class_name.downcase}'
    end
    
    def pointing_to_me(other_obj)
    	'#{other_obj.class_name.downcase}-to-#{self.class_name.downcase}'
    end
  end

end