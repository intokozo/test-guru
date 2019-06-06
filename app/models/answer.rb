class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_max_number, on: :create

  private

  def validate_max_number
    errors.add(:count_answers, "the number of answers should be < 4") if question.answers.count >= 4
  end
end
