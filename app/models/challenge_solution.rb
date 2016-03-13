class ChallengeSolution < ApplicationRecord
  belongs_to :challenge

  validates_presence_of :answer
  validates_inclusion_of :truth, in: [true, false]
end
