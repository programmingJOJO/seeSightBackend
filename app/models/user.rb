class User < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :user_tours
  has_many :surveys
  has_many :tours, through: :user_tours
  accepts_nested_attributes_for :tags, allow_destroy: true

  validates_presence_of :role
  before_create -> { self.token = SecureRandom.hex unless self.token.present? }
  after_save :create_user_tours, on: :create

  enum role: [:guest, :registered_user]

  def self.new_guest
    new { |u| u.guest! }
  end

  private
    def create_user_tours
      self.tours=(Tour.all)
    end
end
