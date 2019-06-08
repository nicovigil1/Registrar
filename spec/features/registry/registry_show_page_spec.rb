require 'rails_helper'

describe "The Registry Show Page" do 
  it 'displays basic information' do
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

    reg1 = user.registries.create(name: 'reg1', location: 'Chicago', open: false)
    reg2 = user.registries.create(name: 'reg2', location: 'Denver')

    visit registry_path(reg1)

    expect(page).to have_content(reg1.name)
    expect(page).to have_content(reg1.location)
    expect(page).to have_content("Closed")
  end

  context 'participants' do
    it 'displays associated participants' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      reg2 = user.registries.create(name: 'reg2', location: 'Denver')

      b_day = Date.parse('2016-08-20')

      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, contact_method: 0, email: "email@email.com", phone: "8675309")

      visit registry_path(reg1)
      
      within("#participant-#{participant.id}") do
        expect(page).to have_content(participant.name)
        expect(page).to have_content(participant.gender)
        expect(page).to have_content(participant.birthday)
        expect(page).to have_content("Phone")
        expect(page).to have_content(participant.email)
        expect(page).to have_content(participant.phone)
      end
    end

    it 'has a link for each participant name' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      reg2 = user.registries.create(name: 'reg2', location: 'Denver')

      b_day = Date.new(1970, 1, 1)
      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, 
                                            contact_method: 0, email: "email@email.com", phone: "8675309")
      
      visit registry_path(reg1)

      expect(page).to have_link(participant.name)
      
      click_on(participant.name)

      expect(current_path).to eq(participant_path(participant))
    end 

    it 'has a link to add a participant to the registry' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      reg2 = user.registries.create(name: 'reg2', location: 'Denver')

      visit registry_path(reg1)

      within "#participants" do 
        expect(page).to have_link("Add Participant") 
        click_on("Add Participant")
      end 

      expect(current_path).to eq(new_registry_participant_path(reg1))
    end 

    it 'has a link to remove a participant from the registry' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      reg2 = user.registries.create(name: 'reg2', location: 'Denver')
      
      b_day = Date.new(1970, 1, 1)
      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, 
                                            contact_method: 0, email: "email@email.com", phone: "8675309")

      visit registry_path(reg1)

      within "#participant-#{participant.id}" do 
        expect(page).to have_link("Remove Participant") 
      end 
    end 
  end
end
