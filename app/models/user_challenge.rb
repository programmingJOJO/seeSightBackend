class UserChallenge < ApplicationRecord
  has_many :challenge_protocols, dependent: :destroy
  belongs_to :challenge
  belongs_to :user
end
