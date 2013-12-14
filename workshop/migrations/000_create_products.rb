5000.times do
  Product.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph(3), serves: [1,2,3,4,5,6].sample, price: Random.rand(10...400), image: '/assets/carousel-03.jpg')
end
