class User < ApplicationRecord
  # Validations
  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :phone
  validates_uniqueness_of :phone
  
  validates_presence_of :name
  validates_uniqueness_of :name

  # Associations
  has_many :user_registries
  has_many :registries, through: :user_registries
  has_many :participants

  def find_enrolled(registry)
    #fixme - better to have a GROUP BY in the controller
    registry.participants.select("participants.*, participant_registries.created_at AS enrolled_at").where(user: self)
  end
end
