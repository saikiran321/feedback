class PostMailer < ActionMailer::Base
  default from: "me12b040@smail.iitm.ac.in"

  def post_email(post)
    @post = post
    @url = "http://students.iitm.ac.in/feedback/posts/#{@post.id}"
    subj = "Feedback Portal: #{@post.title}"
    @tags = Post.includes(:tags).find(post.id).tags
    @tags.each do |tag|
      username = User.where("usertype = ?", tag.id).first.username
      email = "#{username.downcase}@smail.iitm.ac.in"
      mail(to: email, subject: subj)
    end
  end

  def arbit_mail(post)
    mail(to: "dharani.manne@gmail.com", subject: "hey there!!!")
  end

end
