class Tour < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :tour_places, dependent: :destroy
  has_many :places, through: :tour_places
  has_many :user_tours
  has_many :users, through: :user_tours
  belongs_to :city

  validates_presence_of :name, :city_id
end
