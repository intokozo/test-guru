class QuestionsController < ApplicationController
  before_action :set_question, except: %i[index new create]
  before_action :set_test, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    links = @test.questions.map do |question|
      "<div><a href='#{question_path(question)}'>#{question.body}</a></div><br>"
    end
    render html: links.join('').html_safe
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(test)
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:test_id, :body)
  end
end
