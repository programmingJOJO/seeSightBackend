class UserTourPlace < ApplicationRecord
  belongs_to :user_tour
  belongs_to :place

  validates_presence_of :position
  validates_inclusion_of :visited, in: [true, false]

end
