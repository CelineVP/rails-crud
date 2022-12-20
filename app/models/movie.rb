class Movie < ApplicationRecord
  has_many :bookmarks
  # un filmm a plusieurs bookmark, tu ne peux pas le supprimer s'il est dans un bookmark

  validates :title, uniqueness: true, presence: true
  # un film a un titre unique
  validates :overview, presence: true
  # Un film a un aperçu
end
