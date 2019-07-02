class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :delete_all
  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :difficult, -> { where('level > ?', 4) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, (lambda do |title|
                         joins(:category)
                           .where(categories: { title: title })
                           .order(title: :desc)
                           .pluck(:title)
                       end)
  scope :valid, -> { joins(questions: :answers).group(:id) }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
