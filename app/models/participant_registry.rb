class ParticipantRegistry < ApplicationRecord
  # Validations
  validates_uniqueness_of :participant_id, scope: :registry_id

  # Relationships 
  belongs_to :participant
  belongs_to :registry

end