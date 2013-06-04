Product.all.each do |p|
  p.set_number_of_likers( p.likes.count )
  sum = p.likes.sum(&:likeability)
  p.set_likeability_sum( sum )
end
