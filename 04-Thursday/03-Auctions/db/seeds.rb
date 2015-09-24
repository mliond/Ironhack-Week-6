User.destroy_all
Product.destroy_all

5.times do |i|
  u = User.create({
    email: Faker::Internet.email,
    password: 'test',
    password_confirmation: 'test'
    })
  3.times do |k|
    p = u.products.create({
      name: Faker::Name.first_name,
      minprice: rand(1..5),
      deadline: Faker::Time.forward(3)
      })
    3.times do |l|
      p.bids.create({
        amount: rand(6..10),
        user_id: u.id
        })
    end
  end
end

puts 'done'