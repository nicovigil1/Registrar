class Registry < ApplicationRecord
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :location
  validates_uniqueness_of :location
end