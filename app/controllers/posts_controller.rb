class PostsController < ApplicationController

  #skip_authorization_check :only => [:index, :show]

  layout 'main_view'

  load_and_authorize_resource :except => [:show, :index]
  skip_load_resource :only => [:create]



  MAX_POSTS = 10

# ======================
  def index
    @posts = Post.limit(MAX_POSTS)
  end

  def show
    @post = Post.find(params[:id])
    #render layout: 'layouts/post'
  end
# ======================



# ======================
  def edit
    @post = Post.find(params[:id])
    #render layout: 'layouts/post'
  end

  def update
    @post = Post.find(params[:id])
    @post.attributes = post_params

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render action: 'edit'
    end


  end
# ======================


# ======================
  def new
    @post = Post.new
    @right_trail_content = true
  end

  def create

    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_url, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end
# ======================

# ======================

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Info was successfully destroyed.'
  end
# ======================



  private

  def post_params
    params.require(:post).permit(:author, :title, :brief_text, :text, :visible)
  end

end

