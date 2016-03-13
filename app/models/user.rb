class User < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :user_tours
  has_many :tours, through: :user_tours
  has_many :challenges_users, dependent: :destroy
  has_many :challenges, through: :challenges_users

  validates_presence_of :role

  enum role: [:guest, :registered_user]
end
