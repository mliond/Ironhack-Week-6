# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tournament.destroy_all
Player.destroy_all
Registration.destroy_all

players = Player.create([
  {name: Faker::Internet.user_name}, 
  {name: Faker::Internet.user_name}, 
  {name: Faker::Internet.user_name}, 
  {name: Faker::Internet.user_name}, 
  {name: Faker::Internet.user_name} 
])
  
tournaments = Tournament.create([
  {name: Faker::Internet.user_name('World Cup')},
  {name: Faker::Internet.user_name('World Cup')},
  {name: Faker::Internet.user_name('World Cup')}
])

registrations = Registration.create([
  {player_id: players[0].id, tournament_id: tournaments[0].id},
  {player_id: players[0].id, tournament_id: tournaments[0].id},
  {player_id: players[0].id, tournament_id: tournaments[0].id},
  {player_id: players[1].id, tournament_id: tournaments[1].id},
  {player_id: players[2].id, tournament_id: tournaments[1].id},
  {player_id: players[2].id, tournament_id: tournaments[1].id},
  {player_id: players[3].id, tournament_id: tournaments[1].id},
  {player_id: players[3].id, tournament_id: tournaments[2].id},
  {player_id: players[4].id, tournament_id: tournaments[2].id},
  {player_id: players[4].id, tournament_id: tournaments[2].id},
  {player_id: players[4].id, tournament_id: tournaments[2].id}
])

puts 'done'