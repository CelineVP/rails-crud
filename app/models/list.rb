class List < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  # une list à un name unique

  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  # une list peut être supprimer et supprimera les bookmarks associés mais pas les movies
end
