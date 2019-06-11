class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists

  def tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end

  def name
    return 'User' unless first_name || last_name

    "#{first_name} #{last_name}"
  end
end
