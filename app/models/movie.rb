class Movie < ApplicationRecord
  def self.all_ratings = %w[G PG PG-13 R NC-17]

  validates :title, presence: true, length: { maximum: 120 }
  validates :rating, inclusion: { in: all_ratings }
  validates :release_date, presence: true
end
