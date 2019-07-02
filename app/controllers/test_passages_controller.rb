class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      RewardService.new(current_user).call if @test_passage.successful? && @test_passage.first_attempt?
      begin
  TestsMailer.completed_test(@test_passage).deliver_now
      rescue Net::SMTPAuthenticationError
        flash_msg = { alert: 'Gmail authentication error' }
end
      redirect_to result_test_passage_path(@test_passage), flash_msg || {}
    else
      render :show
    end
  end

  def result; end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    response = gist_service.call

    if gist_service.success?
      current_user.gists.create(question_id: @test_passage.current_question.id, url: response.html_url)
      flash_msg = { notice: view_context.link_to('Gist URL', response.html_url, target: :_blank) }
    else
      flash_msg = { alert: 'There was an error!' }
    end

    redirect_to @test_passage, flash_msg
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
