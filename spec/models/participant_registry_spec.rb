require 'rails_helper'

RSpec.describe ParticipantRegistry, type: :model do
  context "validations" do
    it { should validate_presence_of(:enrollment) }
  end
end
