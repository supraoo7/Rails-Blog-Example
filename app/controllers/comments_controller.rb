class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    if @post.comments.create(comment_params).valid?
      redirect_to @post, notice: 'Comment was successfully created.'
    else
      redirect_to @post, alert: @post.comments.create(comment_params).errors.full_messages
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.comments.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end
end
