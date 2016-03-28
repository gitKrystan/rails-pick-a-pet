class VotesController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    vote = @answer.votes.new
    if vote.save
      flash[:notice] = 'Thanks for voting!'
    else
      flash[:alert] = 'Oops. Something went wrong. Call Mike for more info.'
    end
    respond_to do |format|
      format.html { redirect_to questions_path }
      format.js
    end
  end
end
