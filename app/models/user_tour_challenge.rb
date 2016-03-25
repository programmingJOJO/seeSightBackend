class UserTourChallenge < ApplicationRecord
  has_many :challenge_protocols, dependent: :destroy, autosave: true
  belongs_to :challenge
  belongs_to :user_tour
end
