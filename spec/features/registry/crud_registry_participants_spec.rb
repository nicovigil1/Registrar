require 'rails_helper'

describe "A user" do
  context "On the Registry Show Page" do
    xit 'can add a participant to that registry' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')

      visit registry_path(reg1)

      click_on("Add Participant")
      
      fill_in "Name",	with: "Name1"
      fill_in "Gender",	with: "Gender1"  
      fill_in "Birthday",	with: "1/1/1970" 
      fill_in "Enrollment",	with: Date.today
      fill_in "Contact Method",	with: "Phone"
      fill_in "Notes", with: "This is a note"
      fill_in "Email", with: "email@email.com"
      fill_in "Phone",	with: "8675309" 

      click_on "Submit"

      expect(current_path).to eq(registry_path(reg1)) 
      expect(page).to have_content("Name1")
      expect(page).to have_content("Gender1")
      expect(page).to have_content("1/1/1970")
      #FIXME - add more later
    end 

    xit 'can remove a participant from that registry' do 
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)  

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')

      b_day = Date.new(1970, 1, 1)
      participant = reg1.participants.create(name: "Billy Joel", gender: "male", birthday: b_day, 
                                            contact_method: 0, email: "email@email.com", phone: "8675309")

      visit registry_path(reg1)

      within "#participant-#{participant.id}" do 
        expect(page).to have_link("Remove Participant") 
        click_on("Remove Participant")
      end 

      expect(current_path).to eq(registry_path(reg1)) 
      expect(page).to_not have_content(participant.id) 
    end
  end
end
