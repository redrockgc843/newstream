class ArtistSpace < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  validates :artist_name, presence: true
  validates :bio, presence: true

  enum :status, {
    draft: 0,
    published: 1,
    archived: 2
  }
end
