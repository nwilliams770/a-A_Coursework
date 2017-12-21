class PostsController < ApplicationController
  def new
    @subs = Sub.all
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id


    if @post.save
      redirect_to sub_url(@post)
    else
      render[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to sub_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def edit
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @parent_comments = @post.comments.where(parent_comment_id: nil)
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
