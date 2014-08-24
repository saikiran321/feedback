class PostMailer < ActionMailer::Base
	default from: "ch12b034@smail.iitm.ac.in"
  
	def post_notify(recipient)
		mail(to:recipient+"@smail.iitm.ac.in",subject:"Welcome to feedback forum")
	end
end
