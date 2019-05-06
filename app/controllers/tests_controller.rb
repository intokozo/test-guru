class TestsController < ApplicationController
  before_action :get_test, only: :show
  def index
    @test = Test.all
  end

  def show
  end

  private

  def get_test
    @test = Test.find(params[:id])
  end
end
