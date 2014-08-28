class PostsController < ApplicationController
  respond_to :html, :json
  before_filter :current_user, :only => [:create, :edit, :update, :destroy]
  before_filter :find_post, :only => [:edit, :update, :destroy]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def new
    @post = Post.new
  end
   
  def create
    @post = Post.new(post_params)
    flash[:success] = "Successfully posted group" if @post.save

    respond_to do |format|
      if @post.recipients.present?
        UserMailer.welcome_email(@post).deliver
      end
      format.html { redirect_to "/", notice: 'Post was successfully created.' }
      format.js   {}
      format.json { render json: @post, status: :created, location: @post }
    end
  end

  def edit
  end

  def update
    if @post.onid == current_user.onid
      @post.update_attributes(post_params)
    end
    if @post.recipients.present?
      UserMailer.welcome_email(@post).deliver
    end
    respond_with @post, :location => root_path
  end

  def destroy
    if @post.destroy
      flash[:success] = "Successfully deleted"
    else
      flash[:error] = "There was a problem in deleting your post"
    end
    respond_with @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :meeting_time, :recipients, :onid)
  end

  def find_post
    @post = Post.find(params[:id])
  end
	
end
