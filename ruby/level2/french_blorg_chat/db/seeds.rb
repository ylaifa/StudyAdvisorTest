# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Message.destroy_all
Tag.destroy_all

["Urgent", "Secret", "Rigolo"].each do |tag_name|
  Tag.create!(name: tag_name)
end

1000.times do
  m = Message.create!(
    author: Faker::Movies::BackToTheFuture.character,
    content: ["C est un message test", "Il fait beau ici, j espere que chez toi aussi!", "tu rentres quand a la maison, je t ai prepare une tarte a la myrtille"].sample,
    is_french: true,
    tag_id: rand(Tag.first.id..Tag.last.id)
  )
end