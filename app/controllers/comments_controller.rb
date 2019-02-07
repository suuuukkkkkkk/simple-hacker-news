class CommentsController < ApplicationController
  def index
    @comments = Comment.newest
  end
  
  def create
    @link = Link.find_by(id: params[:link_id])
    @comment = @link.comments.new(user: current_user, body: comment_params[:body])

    if @comment.save
     redirect_to n_c_path, notice: 'Comment created'
    else
     redirect_to @link, notice: 'Please write some comment at least 3 chararcters and less than 1000 chararcters excluding white spaces,new lines and tabs'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
