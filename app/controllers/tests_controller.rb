class TestsController < ApplicationController
  def index
    @test = Test.all
  end

  def show
    test = Test.find(params[:id])
    redirect_to test_questions_path(test.id)
  end
end
