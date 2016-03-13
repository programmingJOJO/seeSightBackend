class Tag < ApplicationRecord
  has_and_belongs_to_many :tours
  has_and_belongs_to_many :users
end
