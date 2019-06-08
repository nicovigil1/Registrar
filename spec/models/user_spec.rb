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

  context 'instance methods' do 
    it '.find_enrolled(registry)' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      reg2 = user.registries.create(name: 'reg2', location: 'Denver')

      b_day = Date.new(1970, 1, 1)
      
      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, contact_method: 0, email: "email@email.com", phone: "8675309", user: user)
      participant2 = reg1.participants.create(name: "Ceasar Chavez", gender: "male", birthday: b_day, contact_method: 0, email: "email2@email.com", phone: "222222", user: user)
      participant3 = reg2.participants.create(name: "Delta Dawn", gender: "Female", birthday: b_day, contact_method: 0, email: "email3@email.com", phone: "3333333", user: user)

      expect(user.find_enrolled(reg1)).to include(participant)
      expect(user.find_enrolled(reg1)).to include(participant2)
      expect(user.find_enrolled(reg1)).to_not include(participant3)
    end
  end 
end
