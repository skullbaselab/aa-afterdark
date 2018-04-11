require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create An Account"
  end

  feature "signing up a user" do
    let!(:state) { State.create!(name: 'New York') }
    # #let! evaluates the let block immediately

    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "Oscar"
      fill_in 'Password', with: "starwars"
      select 'New York', from: 'State'
      click_on "Create Account"
    end

    scenario "redirects to tweets index after successful signup" do
      expect(page).to have_content "Greetings, Oscar"
      expect(page).not_to have_content "Create An Account"
      expect(current_path).to eq('/tweets')
    end
  end

  feature "with an invalid user" do

  end

end










# comment
