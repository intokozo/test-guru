class TestsController < ApplicationController
before_action :set_test, only: %i[show edit update destroy]

  def new
    @test = Test.new
  end

  def index
    @test = Test.all
  end

  def show
    test = Test.find(params[:id])
    redirect_to test_questions_path(test.id)
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
