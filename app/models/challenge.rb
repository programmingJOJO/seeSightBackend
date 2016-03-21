class Challenge < ApplicationRecord
  has_many :hints, dependent: :destroy
  has_many :challenge_solutions, dependent: :destroy
  has_many :user_challenges, dependent: :destroy
  has_many :users, through: :user_challenges
  belongs_to :place

  validates_presence_of :question
  validates :difficulty, numericality: { only_integer: true }
end
