class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :find_micropost
  before_action :correct_user, only: :destroy

  def create
    @comment = @micropost.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:error] = "Error creating comment"
    end
    redirect_to request.referrer || root_url
  end

  def destroy
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :parent_comment_id)
    end

    def find_micropost
      @micropost = Micropost.find(params[:micropost_id])
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
