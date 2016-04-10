class UserTour < ApplicationRecord
  has_many :user_tour_places, dependent: :destroy, autosave: true
  has_many :places, -> { order('user_tour_places.position') }, through: :user_tour_places
  has_many :user_tour_challenges, dependent: :destroy
  has_many :challenges, through: :user_tour_challenges
  belongs_to :tour
  belongs_to :user

  validates_inclusion_of :completed, :archived, in: [true, false]
  after_save :create_user_tour_places, on: :create

  scope :not_archived, -> {
    where(archived: false)
  }

  scope :completed, -> {
    where(completed: true)
  }

  scope :partially_visited, -> {
    joins(:user_tour_places).where(user_tour_places: { visited: true })
  }

  private
  def create_user_tour_places
    self.places=(self.tour.places)
  end

  def average_rating
    UserTour.not_archived.completed.where(tour: self.tour).average(:rating).nil? ? 3 : UserTour.not_archived.completed.where(tour: self.tour).average(:rating).ceil
  end

  def has_pause
    (!self.completed && !self.archived && self.user_tour_places.any?{|p| p.visited })
  end
end
