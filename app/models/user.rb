class User < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :user_tours
  has_many :tours, through: :user_tours

  validates_presence_of :role
  before_create -> { self.token = SecureRandom.hex unless self.token.present? }

  enum role: [:guest, :registered_user]

  def self.new_guest
    new { |u| u.guest! }
  end
end
