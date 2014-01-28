class PostsController   < ApplicationController
 layout 'main_view'


  MAX_POSTS = 7

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
    render layout: 'layouts/post'
  end

  def update
    @post = Post.find(params[:id])
  end
# ======================


# ======================
  def new
    @post = Post.new
    @right_trail_content = true
  end

  def create

    #@post = Post.new(params[:post])
    @post = Post.new(post_params)

    if @post.save
      render action: 'new'
      #redirect_to
    else
      render action: 'new'
    end
  end
# ======================

  private

  def post_params
    params.require(:post).permit('author', 'title', 'brief_text', 'text', 'visible')
  end

end

