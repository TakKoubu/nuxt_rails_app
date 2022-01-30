# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'test1@email.com',password: "foobar1", password_confirmation: "foobar1")
User.create!(email: 'test2@email.com',password: "foobar2", password_confirmation: "foobar2")
User.create!(email: 'test3@email.com',password: "foobar3", password_confirmation: "foobar3")
User.create!(email: 'test4@email.com',password: "foobar4", password_confirmation: "foobar4")
