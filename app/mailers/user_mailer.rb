class UserMailer < ActionMailer::Base
  default from: "findafriendapp@gmail.com"
	
	def welcome_email(post)
		@post = post
    if @post.allow_onid
		  mail(to: @post.recipients, subject: @post.title)
    else
      mail(to: @post.recipients, subject: @post.title)
    end
	end
end
