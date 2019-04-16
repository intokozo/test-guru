class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  has_many :questions

  scope :easy, -> { where(level: [0..1]) }
  scope :medium, -> { where(level: [2..4]) }
  scope :difficult, -> { where('level > ?', 4) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  def self.titles(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
