class Country < ApplicationRecord
  has_many :cities

  validates :name, presence: true,
            uniqueness: { case_sensitive: true }
  validates :iso_code, presence: true
end
