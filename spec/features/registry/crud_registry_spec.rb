require 'rails_helper'

describe "Crud Registry" do
  context "create" do
    it 'a user can create a registry' do
      user = User.create(email: "email@email.com", phone: "8675309", name: "Delta Dawn")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit(user_path(user))

      click_on("Create Registry")
      
      expect(current_path).to eq(new_registry_path)
    end
    
  end
  
  
end
