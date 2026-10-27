class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :artist_space

  validates :artist_space_id, uniqueness: { scope: :user_id }
end
