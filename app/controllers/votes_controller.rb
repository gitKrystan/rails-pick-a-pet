class VotesController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    @question = @answer.question
    vote = @answer.votes.new
    @notice = 'Thanks for voting!'
    if vote.save
      flash[:notice] = @notice
    else
      flash[:alert] = 'Oops. Something went wrong. Call Mike for more info.'
    end
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end
end
