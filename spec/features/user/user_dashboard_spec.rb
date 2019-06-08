require "rails_helper"

describe "User Dashboard" do
  it 'can show User information' do
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
    
    visit user_path(user)

    expect(page).to have_content("Welcome, Delta Dawn")
    expect(page).to have_content("Basic Info")

    within "#user-info" do
      expect(page).to have_content(user.phone)
      expect(page).to have_content(user.email)
    end 
  end 

  it 'can show associated User Registries' do 
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
    user2 = User.create(email: "email2@email.com", phone: "2211961", name: "Benny & the Jets")
    reg1 = Registry.create(name: 'reg1', location: 'chicago', user: user)
    reg2 = Registry.create(name: 'reg2', location: 'chicago', user: user)
    reg3 = Registry.create(name: 'reg2', location: 'chicago')
    
    visit user_path(user)

    within "#user-registries" do 
      expect(page).to have_content(reg1.name)
      expect(page).to have_content(reg1.location)
      expect(page).to have_content(reg2.name)
      expect(page).to have_content(reg2.location)
      expect(page).to_not have_content(reg3.name)
      expect(page).to_not have_content(reg3.location)
    end 
  end 

  it 'has the name of each User Registry as a link' do
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
    reg1 = Registry.create(name: 'reg1', location: 'chicago', user: user)
    reg2 = Registry.create(name: 'reg2', location: 'chicago', user: user)
    
    visit user_path(user)

    within "#user-registries" do 
      expect(page).to have_link(reg1.name)
      expect(page).to have_link(reg2.name)
      click_on(reg1.name)
    end

    expect(page).to eq(registry_path(reg1))
  end 
end