class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :phone
  validates_uniqueness_of :phone
  validates_presence_of :name
  validates_uniqueness_of :name
end
