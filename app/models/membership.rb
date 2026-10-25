class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :artist_space
end
