# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.destroy_all
Match.destroy_all

10.times do |i|
  w = Player.create(name: Faker::Internet.user_name)
  l = Player.create(name: Faker::Internet.user_name)
  Match.create({
    winner_id: w.id, 
    loser_id: l.id,
    duration: 10,
    date: Faker::Date.forward(7),
    winner_faction: 'ZERG',
    loser_faction: 'TERRAN'
    })
end

puts 'done'