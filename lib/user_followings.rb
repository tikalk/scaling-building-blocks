module UserFollowings

  def self.included base
    base.send :include, InstanceMethods
    base.extend ClassMethods
  end

  module InstanceMethods
    # follow a user
    def follow!(user)
      following << user.id
      user.followers << self.id
    end
    
    # unfollow a user
    def unfollow!(user)
      following.delete user.id
      user.followers.delete self.id
    end
    
    # users that self follows
    def followers
      User.where("id IN (%s)" % followers.to_s)
    end

    # users that follow self
    def following
      User.where("id IN (%s)" % following.to_s)
    end

    # users who follow and are being followed by self
    def friends
      intersect = followers.intersection following
      User.where("id IN (%s)" % intersect.join(',')) if !intersect.empty?
    end

    # does the user follow self
    def followed_by?(user)
      followers.member? user.id
    end
    
    # does self follow user
    def following?(user)
      following.member? user.id
    end

    # number of followers
    def followers_count
      followers.count
    end

    # number of users being followed
    def following_count
      following.count
    end
  end

  module ClassMethods
  end

end