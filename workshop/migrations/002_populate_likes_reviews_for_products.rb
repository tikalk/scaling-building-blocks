# Populate the likes and reviews
# 100 times randomly add likes and reviews to products
like_ids_range = Like.first.id..Like.last.id
review_ids_range = Review.first.id..Review.last.id
product_ids_range = Product.first.id..Product.last.id
for i in 1..5000
  p = Product.find(Random.new.rand(product_ids_range))
  p.likes << Like.find(Random.new.rand(like_ids_range))
  p.reviews << Review.find(Random.rand(review_ids_range))
  p.likes.first.likeability = Random.new.rand(1..5)
  p.save!
end
