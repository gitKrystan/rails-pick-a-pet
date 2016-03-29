class CommentsController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Thanks for commenting!'
    else
      flash[:alert] = 'Oops. Something went wrong. Call Mike for more info.'
    end
    respond_to do |format|
      format.html { redirect_to questions_path }
      # format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
