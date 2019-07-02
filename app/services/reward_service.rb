class RewardService
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    Badge.find_each do |badge|
      if send "#{badge.rule.attr}_condition_satisfied?", badge.rule.value
        @current_user.badges << badge
      end
    end
  end

  private

  def level_condition_satisfied?(level)
    tests_passed =
      @current_user
      .completed_tests
      .by_level(level)
      .order(:test_id)
      .uniq
    tests_passed == Test.by_level(level).order(:id)
  end

  def category_condition_satisfied?(category)
    tests_passed =
      @current_user
      .completed_tests
      .by_category_id(category)
      .order(:test_id)
      .uniq
    tests_passed == Test.by_category_id(category).order(:id)
  end

  def score_condition_satisfied?(score)
    tests_passed =
      @current_user
      .test_passages
      .where(passed: true)
      .order(:test_id)
      .select { |tp| tp.score.to_i >= score.to_i }
      .uniq
    tests_passed == Test.all.order(:id)
  end

  def attempts_condition_satisfied?(attempts)
    tests_passed =
      @current_user
      .test_passages
      .order(:created_at)
      .group_by(&:test_id)
      .select do |_t_id, t_passages|
        index = t_passages.index(&:passed)
        !index.nil? && index < attempts.to_i
      end
      .keys
      .sort
    tests_passed == Test.all.order(:id).pluck(:id)
  end
end
