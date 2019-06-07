class ParticipantRegistry < ApplicationRecord
  belongs_to :participant
  belongs_to :registry
end