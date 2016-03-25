class UserTourPlace < ApplicationRecord
  belongs_to :user_tour
  belongs_to :place

  validates_presence_of :position
  validates_inclusion_of :visited, in: [true, false]
  after_create :create_user_challenge

  private

    def create_user_challenge
      UserTourChallenge.create!(user_tour_id: self.user_tour.id, challenge_id: self.place.challenges.first.id) if self.place.challenges.any?
    end

end
