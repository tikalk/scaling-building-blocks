users = []

10.times do
  users << User.create(email: Faker::Internet.email, password: 'foobar', password_confirmation: 'foobar')
end


5000.times do
  product = Product.create(name: Faker::Company.name,
                            description: Faker::Lorem.paragraph(3),
                            serves: [1..5].sample,
                            price: [*25..322].sample,
                            image: "carousel-0#{[*1..3].sample}.jpg")
  10.times do
    product.likes << Like.create(likeability: [*1..5].sample, user: users.sample)
  end

  10.times do
    product.reviews << Review.create(description: Faker::Lorem.sentence, user: users.sample)
  end
end
