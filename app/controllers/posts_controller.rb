
class PostsController < ApplicationController
before_action :signed_in_user, only: [:create, :edit, :update]
rescue_from SocketError, :with => :connection_error
def connection_error

  #print "TACOS"
  #render plain: "MORE TACOS"
  
  flash[:notice] = "You're not connected to the internet."
  redirect_to :back
  #print "TACOS"
#redirect_to(:controller => 'start', :action => "post")
end
  def new
    @post = Post.new
  end
	
   
	def create
    @post = Post.new(params[:post].permit(:title, :description, :meeting_time, :recipients, :user_id))

    ## if @post.save
    #  redirect_to action: "index" #Post.all # stop redirection to show
    #else
    #  render 'new'
    #end
		
    respond_to do |format|
      if @post.save
        if @post.recipients.present?
	       UserMailer.welcome_email(@post).deliver
	       end
        format.html { redirect_to "/", notice: 'Post was successfully created.' }
        format.js   {}
        format.json { render json: @post, status: :created, location: @post }
				
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def post
    respond_to do |format|
      format.js
    end
    #@posts = Post.all
    #respond_to do |format|
    #  format.html { }
    #  format.js { }
    #end
    #render :partial => "posts/post", collection: @posts
  end

  def index
    @posts = Post.all
    @post = Post.new
    
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    #redirect_to action: "index" unless @post.user_id == current_user.id
    if @post.user_id == current_user.id && @post.update(params[:post].permit(:title, :description, :meeting_time, :recipients, :user_id))
        if @post.recipients.present?
          UserMailer.welcome_email(@post).deliver
        end
        redirect_to action: "index" #@post
    	else
        render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :meeting_time, :recipients, :user_id)
  end

	
end
