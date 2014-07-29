module PostsHelper

  def tag_this(post)
   post.content.scan(/(?<!\+)[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/).each do |roll|
     @user = User.where("username=?", roll.upcase).take
     post.content.sub!(roll, "<a href='/users/#{@user.id}'>#{@user.fullname.capitalize}</a>")
   end
   post.content.scan(/\+[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1}[0-9]{3}/).each do |roll|
     post.content.sub!(roll, roll.strip[1..8])
   end
  end

end
