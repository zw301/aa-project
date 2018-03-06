# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create!(username: 'Ziyan')
user2 = User.create!(username: 'Todd')
user3 = User.create!(username: 'TingTing')
user4 = User.create!(username: 'Debbie')

piece1 = Artwork.create!(title: 'The Starry Night',
  image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg',
  artist_id: 1)
piece1 = Artwork.create!(title: 'Water Lilies',
  image_url: 'https://resources.matcha-jp.com/archive_files/jp/2015/08/7052a7fa21f37e3bd7e3728e5a775cbb.jpg',
  artist_id: 2)

share1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
share2 = ArtworkShare.create!(artwork_id: 2, viewer_id: 4)
