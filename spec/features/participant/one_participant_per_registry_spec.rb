require 'rails_helper'

# describe "A participant" do
#   it 'can only be involved in a registry once' do 
#     user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")

#     reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
     
#     b_day = Date.new(1970, 1, 1)
#     participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, contact_method: 0, email: "email@email.com", phone: "8675309", user: user)

#     a = reg1.participant_registries.create(participant: participant)
#     b = reg1.participant_registries.create(participant: participant)
    
#     require 'pry'; binding.pry
#   end
# end
