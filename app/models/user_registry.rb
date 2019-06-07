class UserRegistry < ApplicationRecord
  belongs_to :user
  belongs_to :registry
end 