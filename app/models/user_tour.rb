class UserTour < ApplicationRecord
  has_many :user_tour_places, dependent: :destroy, autosave: true
  has_many :places, -> { order('user_tour_places.position') }, through: :user_tour_places
  has_many :user_tour_challenges, dependent: :destroy
  has_many :challenges, through: :user_tour_challenges
  belongs_to :tour
  belongs_to :user

  validates_inclusion_of :completed, :archived, in: [true, false]

  scope :not_archived, -> {
    where(archived: false)
  }
end
