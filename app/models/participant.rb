class Participant < ApplicationRecord
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :gender
  validates_presence_of :birthday
  validates_presence_of :contact_method
  validates_presence_of :email
  validates_presence_of :phone

  # Associations
  has_many :participant_registries, dependent: :destroy
  has_many :registries, through: :participant_registries

  # Enums
  enum contact_method: {Phone: 0, Email: 1}
end
