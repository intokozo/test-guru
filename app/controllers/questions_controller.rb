class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index new create]
  before_action :get_question, only: %i[show edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quest_404

  def new
    @question = @test.questions.new
  end

  def show
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def get_question
    @question = Question.find(params[:id])
  end

  def get_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_quest_404
    render plain: '404. Этот вопрос отсутствует.', status: 404
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
