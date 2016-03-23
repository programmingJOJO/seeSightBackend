class UserTourPlace < ApplicationRecord
  belongs_to :user_tour
  belongs_to :place

  validates_presence_of :position
  validates_inclusion_of :visited, in: [true, false]
  after_create :create_user_challenge

  private

    def create_user_challenge
      puts 'USER'
      puts 'USER'
      puts self.user_tour.user_id
      puts 'USER'
      puts 'USER'
      puts 'ANY'
      puts 'ANY'
      puts self.place.challenges.any?
      puts 'ANY'
      puts 'ANY'
      UserChallenge.create!(user_id: self.user_tour.user_id, challenge_id: self.place.challenges.first.id) if self.place.challenges.any?
    end

end
