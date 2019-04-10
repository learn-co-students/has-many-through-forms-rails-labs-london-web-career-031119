class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = User.all
    @comment = Comment.new
    @my_users = @post.comments.map(&:user).uniq
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    @post.categories.build(name: "")
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
