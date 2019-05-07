class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index create]
  before_action :get_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quest_404

  def index
  end

  def show
  end

  def new
    @text = "Давайте создадим новый вопрос!"
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to test_path(question.test_id)
    else
      @text = "Поле не должно быть пустым, попробуйте еще раз."
      render template: 'questions/new'
    end
  end

  def destroy
    question = @question.destroy
    redirect_to test_path(question.test_id)
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
