class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save
      redirect_to post_path(@post.id)
      flash[:success] = '投稿が保存されました'
    else
      redirect_to post_path(@post.id)
      flash[:danger] = '投稿に失敗しました'
    end
  end

  private
  def post_params
    params.require(:post).permit(:caption, photos_attributes:[:image]).merge(user_id: current_user.id)
  end

end
