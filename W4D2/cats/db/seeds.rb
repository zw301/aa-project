# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all


10.times do
  cats_birthday = Faker::Date.between(2000.days.ago, Date.today)
  Cat.create(
    name: Faker::Name.first_name,
    birth_date: cats_birthday,
    age: (Date.today - cats_birthday)/365,
    color: %w(yellow black white).sample,
    sex: %w(M F).sample,
    description: Faker::HarryPotter.quote
  )
end
