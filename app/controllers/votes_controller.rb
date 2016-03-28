class VotesController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    vote = @answer.votes.new
    if vote.save
      flash[:notice] = 'Thanks for voting!'
    else
      flash[:alert] = 'Oops. Something went wrong. Call Mike for more info.'
    end
    redirect_to questions_path
  end
end
