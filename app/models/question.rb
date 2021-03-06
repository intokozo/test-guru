class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :delete_all
  has_many :gists

  validates :body, presence: true

  def position
    test.questions.order(:id).pluck(:id).index(id) + 1
  end
end
