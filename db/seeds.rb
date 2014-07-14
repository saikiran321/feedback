# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tag1 = Tag.create(name:"mess")
tag2 = Tag.create(name:"student facilities")
tag3 = Tag.create(name:"general")

user1 = User.new(name: 'dharani', roll: 'me12b040', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user1.save
user2 = User.new(name: 'amulya', roll: 'me12b015', password: 'amulya', password_confirmation:'amulya', hostel: 'godavari')
user2.save
user3 = User.new(name: 'murthy', roll: 'me12b050', password: 'amulya', password_confirmation:'amulya', hostel: 'mandak')
user3.save
user4 = User.new(name: 'Tapan Chugh', roll: 'ce12b055', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user4.save
user5 = User.new(name: 'Vaddi Kiran', roll: 'me12b099', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user5.save
user6 = User.new(name: 'M Vinod Kumar', roll: 'me12b038', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user6.save
user7 = User.new(name: 'Sethu Madhavan', roll: 'ce12b076', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user7.save
user8 = User.new(name: 'Ravi Chandra', roll: 'ee12b036', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user8.save
user9 = User.new(name: 'Kartik Sharma', roll: 'ch12b032', password: 'amulya', password_confirmation:'amulya', hostel: 'ganga')
user9.save

post1 = Post.new(title: "post 1",content: "This is a sample post, first one.")
post1.user = user1
post1.tags << tag1
post1.save
post2 = Post.new(title: "post 2",content: "This is a sample post, second one.")
post2.user = user1
post2.save
post3 = Post.new(title: "post 3",content: "This is a sample post, third one.")
post3.user = user1
post3.save
post4 = Post.new(title:"post 4",content: "This is a sample post, fourth one.")
post4.user = user2
post4.save
post5 = Post.new(title:"post 5",content: "This is a sample post, fifth one.")
post5.user = user3
post5.save
post6 = Post.new(title:"post 6",content: "This is a sample post, sixth one.")
post6.user = user4
post6.save
post7 = Post.new(title:"post 7",content: "This is a sample post, seventh one.")
post7.user = user5
post7.save
post8 = Post.new(title:"post 8",content: "This is a sample post, eighth one.")
post8.user = user6
post8.save
post9 = Post.new(title:"post 9",content: "This is a sample post, ninth one.")
post9.user = user7
post9.save

comment1 = Comment.new(content: "This is the first comment")
comment1.post = post1
comment1.user = user2
comment1.save
comment2 = Comment.new(content: "This is the second comment")
comment2.post = post1
comment2.user = user3
comment2.save
comment3 = Comment.new(content: "This is the third comment")
comment3.post = post1
comment3.user = user4
comment3.save
comment4 = Comment.new(content: "This is the fourth comment")
comment4.post = post1
comment4.user = user5
comment4.save
comment5 = Comment.new(content: "This is the fifth comment")
comment5.post = post2
comment5.user = user3
comment5.save
