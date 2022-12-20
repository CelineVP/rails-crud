class Bookmark < ApplicationRecord
  belongs_to :movie
  # un bookmark fait référence à un movie
  belongs_to :list
  # un bookmark fait référence à une list

  validates :comment, length: { minimum: 6 }
  # un comment associé à un signet à minmum 6 caractères
  validates :movie_id, uniqueness: { scope: :list_id }
  # bookmark est lié à un film et à une list
end
