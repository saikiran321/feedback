# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

post = Post.new
post.user_id = 9528
post.title = "hey there"
post.content = "this is the content of my post..."
post.save

notification = Notification.new
notification.user_id = 9528
notification.post_id = 1
notification.action = 'commented'
notification.notif_user = 9563
notification.save

comment = Comment.new
comment.user_id = 9528
comment.post_id = 1
comment.content = "hey this is the content of my comment"
comment.save
