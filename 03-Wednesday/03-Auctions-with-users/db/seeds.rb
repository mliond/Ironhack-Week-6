User.destroy_all
Product.destroy_all

puts "Deleted all users and products."

num = 5

num.times do |i|
  u = User.new({
    name: Faker::Internet.user_name,
    password: "test",
    email: Faker::Internet.email
    })
  u.save
  3.times do |k|
    u.products.create({
      name: Faker::App.name,
      description: Faker::Hacker.say_something_smart,
      deadline: Faker::Time.forward(10),
      min_price: rand(1..25)
      })
  end
end

50.times do |i|
  Bid.create({
    amount: rand(1..5),
    user_id: User.all.sample.id,
    product_id: Product.all.sample.id
    })
end

puts "Created #{num} new users with 3 products each."
puts "Created 50 new bids."