class Challenge < ApplicationRecord
  has_many :hints, dependent: :destroy
  has_many :challenge_solutions, dependent: :destroy
  has_many :challenges_users, dependent: :destroy
  has_many :users, through: :challenges_users
  belongs_to :place

  validates_presence_of :question
  validates :difficulty, numericality: { only_integer: true }
end
