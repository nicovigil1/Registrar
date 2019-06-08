class ParticipantRegistry < ApplicationRecord
  # Validation
  validates_presence_of :enrollment

  belongs_to :participant
  belongs_to :registry
end