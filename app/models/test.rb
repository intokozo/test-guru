class Test < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :users

  def self.category(title)
    Test.joins(:category).order(title: :desc).where(categories: { title: title }).pluck(:title)
  end
end
