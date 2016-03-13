class TourPlace < ApplicationRecord
  belongs_to :tour
  belongs_to :place

  validates_presence_of :default_position
end
