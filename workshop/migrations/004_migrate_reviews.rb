Product.all.each do |p|
  p.set_number_of_reviews( p.reviews.count )
end
