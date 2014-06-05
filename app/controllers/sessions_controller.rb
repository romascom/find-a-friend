class SessionsController < ApplicationController

	def new
	end
	
	def create
	   	user = User.find_by(email: params[:session][:email].downcase)
	    	if user
		 sign_in user
		 redirect_to root_url
	    	else
		 flash[:error] = 'Invalid email' # Not quite right!
		 render 'new'
    		end
   	end
	
	def destroy
    		sign_out
    		redirect_to root_url
  	end
end
