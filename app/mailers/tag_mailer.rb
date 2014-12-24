class TagMailer < ActionMailer::Base
  default from: "me12b040@smail.iitm.ac.in"

  def tag_post_email(post, user)
    @post = post
    @url = "http://students.iitm.ac.in/feedback/posts/#{@post.id}"
    subj = "Feedback Portal - tagged: #{@post.title}"
    @user = user
    email = "#{user.username.downcase}@smail.iitm.ac.in"
    mail(to: email, subject: subj)
  end

  def tag_comment_email(comment, user)
    @comment = comment
    @post = Post.find(@comment.post_id)
    @url = "http://students.iitm.ac.in/feedback/posts/#{@post.id}"
    subj = "Feedback Portal - tagged: #{@post.title}"
    @user = user
    email = "#{user.username.downcase}@smail.iitm.ac.in"
    mail(to: email, subject: subj)
  end

end
