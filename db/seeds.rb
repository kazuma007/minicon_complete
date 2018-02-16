# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.create!(name: "マギ", price: 500)
Event.create!(name: "シンドバッドの冒険", price: 600)
Event.create!(name: "海皇紀", price: 580)

User.create!(name: "アラジン", email: "magi@hoge.com", password: "magimagi")

Favorite.create!(user_id: 1, event_id: 1)
Favorite.create!(user_id: 1, event_id: 3)