class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    @notice = 'Thanks for commenting!'
    if @comment.save
      respond_to do |format|
        format.js
        format.html do
          flash[:notice] = @notice
          redirect_to questions_path
        end
      end
    else
      flash[:alert] = 'Oops. Something went wrong. Call Mike for more info.'
      respond_to do |format|
        format.html { redirect_to questions_path }
      end
    end
  end
  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
