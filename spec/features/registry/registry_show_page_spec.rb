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

      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, contact_method: 0, email: "email@email.com", phone: "8675309", user: user)

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
                                            contact_method: 0, email: "email@email.com", phone: "8675309", user: user)
      
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
                                            contact_method: 0, email: "email@email.com", phone: "8675309", user: user)

      visit registry_path(reg1)

      within "#participant-#{participant.id}" do 
        expect(page).to have_link("Remove Participant") 
      end 
    end 
  end

  context "Coordinators" do
    it 'should be able to see all coordinators in a registry' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      user2 = reg1.users.create(email: "email2@email.com", phone: "86753092", name: "Elton John")

      visit registry_path(reg1)

      within "#users" do
        expect(page).to have_content(user2.name)
        expect(page).to have_content(user2.phone)
        expect(page).to have_content(user2.email)
      end
    end  

    it 'should be able to add coordinators to a registry' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      user2 = User.create(email: "email2@email.com", phone: "86753092", name: "Elton John")
      user3 = User.create(email: "email3@email.com", phone: "86753093", name: "Billy Joel")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')

      visit registry_path(reg1)

      within "#users" do
        expect(page).to have_link("Add Coordinator")
        click_link("Add Coordinator")
      end

      expect(page).to have_link(user2.name) 
      expect(page).to have_link(user3.name) 

      click_link(user2.name)

      within "#users" do
        expect(page).to have_content(user2.name)
        expect(page).to have_content(user2.phone)
        expect(page).to have_content(user2.email)
      end
    end

    it 'should be able to remove coordinators from a registry' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      user3 = User.create(email: "email3@email.com", phone: "86753093", name: "Billy Joel")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')
      user2 = reg1.users.create(email: "email2@email.com", phone: "86753092", name: "Elton John")

      visit registry_path(reg1)

      within "#user-#{user2.id}" do
        expect(page).to have_link("Remove Coordinator")
        click_link("Remove Coordinator")
      end

      expect(page).to_not have_content(user2.name)
      expect(page).to_not have_content(user2.phone)
      expect(page).to_not have_content(user2.email)
    end 
  end
  
end
