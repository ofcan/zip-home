class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_commentable
  before_filter :find_comment, :only => :destroy
  before_filter :authorize_admin_or_creator, :only => :destroy

  def create
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, :notice => 'Comment created.'
    else
      redirect_to @commentable, :alert => 'Comment not created.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, :notice => 'Comment destroyed.'
  end

  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        @commentable = $1.classify.constantize.find(value)
        return @commentable
      end
    end
    raise ActiveRecord:NoRecord.new("Couldn't find commentable.")
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_admin_or_creator
    unless current_user.try(:admin) || @comment.user == current_user
      redirect_to @commentable
      flash[:alert] = "You can't do that."
    end
  end
  
end
