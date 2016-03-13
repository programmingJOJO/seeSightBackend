class UserTour < ApplicationRecord
  has_many :user_tour_places
  has_many :places, -> { order('user_tour_places.position') }, through: :user_tour_places
  belongs_to :tour
  belongs_to :user

  validates_inclusion_of :completed, in: [true, false]
end
