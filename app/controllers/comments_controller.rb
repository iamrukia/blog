class CommentsController < ApplicationController
  before_filter :load_post, :except => :destroy
  before_filter :authenticate, :only=> :destroy

  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.create(params[:comment])
    #redirect_to post_path(@post)

    @comment = @post.comments.new(params[:comment])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post, :notice => 'Thanks for your comment'}
        format.js 
      end
    else
      respond_to do |format|
        format.html {redirect_to @post, :alert => 'Unable to add comment'}
        format.js { render 'fail_create.js.erb'}
      end
    end


  end


  def destroy
    #@post = Post.find(params[:post_id])
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to post_path(@post), :notice => 'Comment Deleted'}
      format.js
    end
    #redirect_to post_path(@post)

  end

  private
  def load_post
    @post = Post.find(params[:post_id])
  end
end