
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.delete_all 
# Post.delete_all 
# Comment.delete_all 

users = []
20.times do 
	users<<User.create(password: "1", username: Faker::Internet.user_name, email: Faker::Internet.email)
end 

posts = [] 
	users.each do |t|
		2.times do 
			posts<<Post.create(user_id: t.id, hipster: Faker::Hipster.paragraph)
		end 
	end 

comments = [] 
	posts.each do |t|
		3.times do 
			comments<<Comment.create(user_id:users.sample.id, post_id: t.id, body: Faker::StarWars.quote)
		end
	end 

