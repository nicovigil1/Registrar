require 'rails_helper'

RSpec.describe Participant, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:gender) }
    it { should validate_presence_of(:birthday) }
    it { should validate_presence_of(:contact_method) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end

  context "associations" do
    it { should have_many(:participant_registries) }  
    it { should have_many(:registries) }  
  end
  
end
