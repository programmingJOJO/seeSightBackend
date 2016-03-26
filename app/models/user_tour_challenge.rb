class UserTourChallenge < ApplicationRecord
  has_many :challenge_protocols, dependent: :destroy, autosave: true
  belongs_to :challenge
  belongs_to :user_tour

  validates_presence_of :user_tour_id, :challenge_id, :state

  state_machine initial: :pending do
    state :pending, value: 0
    state :false_answer, value: 1
    state :took_hint, value: 2
    state :solved, value: 3

    event :solve do
      transition [:pending, :false_answer, :took_hint] => :solved
    end

    after_transition [:pending, :false_answer, :took_hint] => :solved do |user_tour_challenge, transition|

    end

    event :false_answered do
      transition [:pending, :false_answer, :took_hint] => :false_answer
    end

    after_transition [:pending, :false_answer, :took_hint] => :false_answer do |user_tour_challenge, transition|

    end

    event :take_hint do
      transition [:pending, :false_answer, :took_hint] => :took_hint
    end

    after_transition [:pending, :false_answer, :took_hint] => :took_hint do |user_tour_challenge, transition|

    end

    after_transition any => any do |user_tour_challenge, transition|

      user_tour_challenge.challenge_protocols.create(
          answer: user_tour_challenge.answer,
          hint_id: user_tour_challenge.hint_id,
          state: user_tour_challenge.state,
          lat: user_tour_challenge.lat,
          lng: user_tour_challenge.lng
      )
      user_tour_challenge.save!
    end
  end
end
