class Place < ApplicationRecord
  has_many :tour_places, dependent: :destroy
  has_many :tours, through: :tour_places
  has_many :user_tour_places
  has_many :user_tours, through: :user_tour_places
  has_many :challenges, dependent: :destroy
  belongs_to :city

  validates_presence_of :city_id, :name
end
