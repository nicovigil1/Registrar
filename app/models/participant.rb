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
  belongs_to :user

  # Enums
  enum contact_method: {Phone: 0, Email: 1}

  def self.count_by_birth_year
    ans = Participant.group("DATE_TRUNC('year', birthday)").count
    new_hash = {}
    ans.map do |year, count|
      new_year = year.to_date.year
      new_hash[new_year] = count
    end
    new_hash
  end
end
