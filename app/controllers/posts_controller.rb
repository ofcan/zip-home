class PostsController < ApplicationController
  
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]
  before_filter :assert_admin, :only => [:new, :create, :edit, :update, :destroy]

  layout 'two_column'

  def index
    @posts = Post.order('created_at desc').all
  end

  def show
    @comments = @post.comments.order("created_at desc")
    @commentable = @post
    @comment = @commentable.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user
    if @post.save
      redirect_to @post, :notice => 'Post created.'
    else
      render :new
      flash.now[:alert] = 'Post not created.'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice => 'Post updated.'
    else
      render :edit
      flash.now[:alert] = 'Post not updated.'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, :notice => 'Post deleted.'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

end
