class Movie < ApplicationRecord
  include SearchFlip::Model

  scope :last_movies, ->(limit) { order(released_date: :desc).limit(limit) }

  notifies_index(MovieIndex)
end
