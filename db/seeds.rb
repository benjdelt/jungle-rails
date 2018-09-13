# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all
 
cat1.products.create!({
  name:  'Men\'s Classy shirt',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Women\'s Zebra pants',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel2.jpg'),
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Hipster Hat',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel3.jpg'),
  quantity: 0,
  price: 34.49
})

cat1.products.create!({
  name:  'Hipster Socks',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel4.jpg'),
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Russian Spy Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel5.jpg'),
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Human Feet Shoes',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel6.jpg'),
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Modern Skateboards',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics1.jpg'),
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Hotdog Slicer',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics2.jpg'),
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'World\'s Largest Smartwatch',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('electronics3.jpg'),
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Optimal Sleeping Bed',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture1.jpg'),
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Electric Chair',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture2.jpg'),
  quantity: 2,
  price: 987.65
})

cat3.products.create!({
  name:  'Red Bookshelf',
  description: Faker::Hipster.paragraph(4),
  image: open_asset('furniture3.jpg'),
  quantity: 23,
  price: 2_483.75
})

User.destroy_all

User.create!(first_name: "Harvey", last_name: "Kutch", email: "Jamar58@gmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Cletus", last_name: "Gleichner", email: "Rosina.Reinger2@hotmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Mossie", last_name: "Walker", email: "Abbigail.Treutel65@yahoo.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Mervin", last_name: "Welch", email: "Braeden96@gmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Gonzalo", last_name: "Kuphal", email: "Oran.Bosco55@yahoo.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Raina", last_name: "Breitenberg", email: "Lyla.Watsica@hotmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Jayme", last_name: "McCullough", email: "Brannon29@hotmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Floy", last_name: "Veum", email: "Fritz_Rippin80@gmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Keven", last_name: "Franecki", email: "Kenny97@hotmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )
User.create!(first_name: "Kevin", last_name: "Price", email: "Alfreda_Streich6@gmail.com", password_digest: "$2a$10$N7Iun7IZd5vea6wCXRTfX.z67INmEsyM3DEEy2RJ2NvQXjW8mspB6" )

Review.destroy_all 

Review.create!(description: "et omnis nulla", rating: 1, user_id: 5, product_id: 2 )
Review.create!(description: "quisquam perferendis inventore", rating: 4, user_id: 8, product_id: 3 )
Review.create!(description: "id provident et", rating: 4, user_id: 5, product_id: 4 )
Review.create!(description: "qui consequuntur voluptatem", rating: 5, user_id: 5, product_id: 12 )
Review.create!(description: "impedit ea rerum", rating: 5, user_id: 8, product_id: 5 )
Review.create!(description: "et modi suscipit", rating: 3, user_id: 9, product_id: 7 )
Review.create!(description: "aut optio culpa", rating: 3, user_id: 2, product_id: 6 )
Review.create!(description: "doloremque qui rerum", rating: 1, user_id: 6, product_id: 2 )
Review.create!(description: "nihil voluptatibus fugiat", rating: 1, user_id: 6, product_id: 6 )
Review.create!(description: "aliquam vitae officia", rating: 3, user_id: 7, product_id: 10 )
Review.create!(description: "aut rerum iure", rating: 5, user_id: 4, product_id: 1 )


puts "DONE!"
