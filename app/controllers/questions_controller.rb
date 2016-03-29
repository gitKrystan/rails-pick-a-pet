class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_answers, only: [:edit, :update]

  # GET /questions
  def index
    @questions = Question.all
    @vote = Vote.new
    @comment = Comment.new
  end

  # GET /questions/new
  def new
    @question = Question.new
    2.times { @question.answers.build }
    set_answers
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created.'
    else
      set_answers
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Question was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    def set_answers
      @answers = @question.answers
    end

    # Only allow a trusted parameter "white list" through.
    def question_params
      params.require(:question)
            .permit(:description,
                    answers_attributes: [:id, :content])
    end
end
