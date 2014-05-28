class UserMailer < ActionMailer::Base
  default from: "findafriendapp@gmail.com"
	
	def welcome_email(post)
		@post = post
		@url = 'http://www.google.com'
		mail(to: @post.recipients, subject: @post.title)
	end
end
