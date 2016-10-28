100.times do |n|
    title = Faker::Pokemon.name
    p title
    content = Faker::Pokemon.location
    user_id = 4
    p user_id
    Picture.create!(title: title,
                content: content,
                user_id: user_id,
                )
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
