class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title, :description, :meeting_time))

    ## if @post.save
    #  redirect_to action: "index" #Post.all # stop redirection to show
    #else
    #  render 'new'
    #end

    respond_to do |format|
      if @post.save
        format.html { redirect_to index, notice: 'Post was successfully created.' }
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

    if @post.update(params[:post].permit(:title, :description, :meeting_time))
      redirect_to action: "index" #@post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :meeting_time)
  end
end
