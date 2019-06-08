require 'rails_helper'

describe "A user" do
  context "on the registry show page" do
    it 'can toggle the open status of the registry' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")

      reg1 = user.registries.create(name: 'reg1', location: 'Chicago')

      visit registry_path(reg1)
      
      within "#basic-info" do
        expect(page).to have_link("Toggle Open Status")
        click_link("Toggle Open Status") 
      end

      within "#basic-info" do
        expect(page).to have_content("Closed")
      end
    end
  end
end
