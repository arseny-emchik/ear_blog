class PostsController < ApplicationController

  #load_and_authorize_resource :except => [:show, :index, :archive]
  #skip_load_resource :only => [:create, :upload_image]



  MAX_POSTS = 10

# ======================
  def index
    @posts = Post.blog.where(:visible => true).limit(MAX_POSTS)
    @post_draft = Post.blog.where(:visible => false)
  end

  def show
    @post = Post.find(params[:id])
  end
# ======================

# ======================
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.attributes = post_params
    @post.author ||= Post::AUTHOR

    if @post.visible? and  @post.publication_time.nil?
      @post.publication_time = Time.now
    end

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully update.'
    else
      render action: 'edit'
    end
  end
# ======================


# ======================
  def new
    @post = Post.new(author: Post::AUTHOR)
    @right_trail_content = true # for test
  end

  def create

    @post = Post.new(post_params)
    @post.author ||= Post::AUTHOR

    if @post.visible? and  @post.publication_time.nil?
      @post.publication_time = Time.now
    end

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
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end
# ======================

# ======================
  def archive
    @current_tab = :labs

    @list_posts = Post.blog.all
    @list_labs = Post.labs.all
  end
# ======================

  def upload_image
    @func_num = params["CKEditorFuncNum"]
    @ck_editor = params["CKEditor"]
    if params.include?(:upload)
      data = params.delete(:upload)
      name =  data.original_filename
      directory = "public/images"
      # create the file path
      path = File.join(directory, name)
      # write the file
      File.open(path, "wb") { |f| f.write(data.read) }

      #@image = Image.create({:data => data}) if data.present?
      @image_url = "/images/#{name}"
    end
    render :layout => false
  end


  private

  def initialize_for_layout
    @current_tab = :blog
  end

  def post_params
    params.require(:post).permit(:author, :title, :brief_text, :text, :visible, :category, :publication_time)
  end

end

