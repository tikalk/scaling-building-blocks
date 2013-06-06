# Populate the likes and reviews
# 100 times randomly add likes and reviews to products
 
 # create likes 
for i in 1..5
  l =  Like.new :likeability => i
  l.save!
end

r =  Review.new :description => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean risus justo, blandit sed elit vulputate, gravida venenatis nulla. Duis ullamcorper ullamcorper mi, in pulvinar odio hendrerit nec. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Integer malesuada leo arcu, volutpat posuere arcu tincidunt id. Mauris et sollicitudin mi. Praesent venenatis diam elit, sit amet posuere nulla tempor vitae. Duis faucibus lacinia pharetra. Nulla ut lacus non erat sollicitudin porttitor. Sed quis erat turpis. Morbi dapibus elementum dui eu sodales. Praesent elit velit, ultrices sit amet sem a, ornare lacinia tellus. Nulla nisi sem, commodo ac gravida eu, luctus non nibh. Integer congue mauris quis dui hendrerit, ac vestibulum neque consequat.'
r.save!

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
