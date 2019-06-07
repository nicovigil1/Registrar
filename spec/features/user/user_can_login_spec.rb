require 'rails_helper'

describe "A user" do  
  it "can visit the homepage" do
    visit root_path
    
    expect(page).to have_content("Welcome to Registrar!") 
  end

  it 'can login' do 
    user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")

    visit root_path

    within "#login" do
      expect(page).to have_content("Enter Email") 
      
      fill_in "Enter Email",	with: "email@email.com"
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user)) 
  end

  it "can register" do
    visit root_path
    
    within "#login" do
      expect(page).to have_content("Enter Email") 
      expect(page).to have_content("Register")

      click_on "Register"

      expect(current_path).to eq(new_user_path)
    end
    
    fill_in "Name (first & last)",	with: "Delta Dawn"
    fill_in "Email",	with: "email@email.com"
    fill_in "Phone",	with: "8675309"
    
    click_on "Submit"

    new_user = User.find_by(email: "email@email.com")

    expect(new_user.class).to eq(User)
    expect(current_path).to eq(user_path(new_user)) 
  end

  it "can't register with bad credentials" do
    visit root_path
    
    within "#login" do
      expect(page).to have_content("Enter Email") 
      expect(page).to have_content("Register")

      click_on "Register"

      expect(current_path).to eq(new_user_path)
    end

    fill_in "Name (first & last)",	with: "Delta Dawn"
    fill_in "Email",	with: "email@email.com"
    
    click_on "Submit"
    
    expect(page).to have_content("Phone can't be blank") 
  end
end
