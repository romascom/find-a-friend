class PostsController < ApplicationController
  respond_to :html, :json
  before_filter :current_user, :only => [:create, :edit, :update, :destroy]
  before_filter :find_post, :only => [:edit, :update, :destroy, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
   
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Successfully posted group"
    else
      flash[:error] = "Unable to save your post"
    end
    respond_with @post, :location => root_path
  end

  def show
  end

  def edit
  end

  def update
    if @post.onid == current_user
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
    params.require(:post).permit(:title, :description, :location, :meeting_time, :end_time, :recipients, :onid)
  end

  def find_post
    @post = Post.find(params[:id])
  end
	
end
