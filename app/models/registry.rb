class Registry < ApplicationRecord
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :location

  # Associations
  has_many :user_registries
  has_many :users, through: :user_registries
  has_many :participant_registries
  has_many :participants, through: :participant_registries
end