class Bookmark < ApplicationRecord
  validates :comment, length: { minimum: 6 }
  validates :movie, presence: true
  validates :list, presence: true
  validates :movie_id, uniqueness: { scope: :list_id, message: "This movie is already in the list" }
  belongs_to :movie
  belongs_to :list
end
