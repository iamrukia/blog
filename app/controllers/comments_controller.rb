class CommentsController < ApplicationController
  before_filter :load_post, :except => :destroy
  before_filter :authenticate, :only=> :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end


  def destroy
    #@post = Post.find(params[:post_id])
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def load_post
    @post = Post.find(params[:post_id])
  end
end