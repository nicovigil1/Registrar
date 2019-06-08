require 'rails_helper'

describe "Businiess Logic" do
  it 'aggregate count of participants per year' do
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")

    reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
    reg2 = user.registries.create(name: 'reg2', location: 'Denver')

    b_day = Date.new(1970, 1, 1)
    b_day2 = Date.new(1970, 1, 1)
    b_day3 = Date.new(1971, 1, 1)
    
    participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, contact_method: 0, email: "email@email.com", phone: "8675309", user: user)
    participant2 = reg1.participants.create(name: "Ceasar Chavez", gender: "male", birthday: b_day2, contact_method: 0, email: "email2@email.com", phone: "222222", user: user)
    participant3 = reg2.participants.create(name: "Delta Dawn", gender: "Female", birthday: b_day3, contact_method: 0, email: "email3@email.com", phone: "3333333", user: user)

    expect(Participant.count_by_birth_year).to eq({1970=> 2, 1971=> 1})
  end
end
