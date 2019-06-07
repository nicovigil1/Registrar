class Participant < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :gender
  validates_presence_of :birthday
  validates_presence_of :enrollment
  validates_presence_of :contact_method
  validates_presence_of :email
  validates_presence_of :phone
end
