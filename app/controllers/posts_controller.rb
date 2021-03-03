class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.includes(:photos, :user).order(created_at: :desc)
  end

  def new
     @post = Post.new
     @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.photos.present?
        @post.save
        redirect_to posts_path
        flash[:success] = '投稿が保存されました'
      else
        redirect_to new_post_path
        flash[:danger] = '投稿に失敗しました'
      end
    end
  end

  def confirm
    @post = current_user.posts.new(post_params)
    render :new unless @post.valid?
  end


  def show
  end

  def edit
  end

  def update
   if @post.update(post_params)
      redirect_to posts_path
      flash[:notice] = "コメントを変更しました"
   else
      render :edit
      flash[:danger] = "コメントを変更できませんでした"
    end
  end

  def destroy
    if @post.user == current_user
      if @post.destroy
        flash[:success] = '投稿が削除されました'
      end
    else
      flash[:danger] = '投稿の削除に失敗しました'
    end
    redirect_to posts_path(@post.user.id)
  end

  private
  def post_params
    params.require(:post).permit(:caption, photos_attributes:[:image, :image_cache]).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
