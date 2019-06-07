require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_uniqueness_of(:phone) }
  end

  context "associations" do
    it { should have_many(:user_registries) } 
    it { should have_many(:registries) } 
  end
  
end
