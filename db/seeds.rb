# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = []
100.times do
  u = User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 12345678)
  users << u
end

5.times do
  league = League.create(name: Faker::Movies::HitchhikersGuideToTheGalaxy.planet)
  20.times do |i|
    UserLeagueRanking.create(user_id: users.sample.id, league_id: league.id, position: i)
  end
end
