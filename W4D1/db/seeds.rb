# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

users = User.create([{username: 'Homer'}, {username: 'Bart'}, {username: 'Marge'}])

artworks = Artwork.create([{title: 'birth of homer', image_url: 'poop.com', artist_id: 10},
    {title: 'bart watch', image_url: 'poop.net', artist_id: 8},
    {title: 'marge in the mirror', image_url: 'poop.gov', artist_id: 9}
    ])
