require 'rails_helper'

RSpec.describe Registry, type: :model do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:location) }

    it 'should have open status of registry default to false' do
      registry = Registry.new(name: "name", location: "chicago")

      expect(registry.open).to eq(true)
    end
  end

  context "associations" do
    it { should have_many(:participant_registries) } 
    it { should have_many(:participants) } 
    it { should have_many(:user_registries) } 
    it { should have_many(:users) } 
  end
  
end
