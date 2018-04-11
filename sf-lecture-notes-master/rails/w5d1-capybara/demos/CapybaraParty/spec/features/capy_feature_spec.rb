require 'rails_helper'

feature "capybara features", type: :feature do
  feature "making a new capybara" do

    before(:each) do
      visit new_capy_url
    end

    scenario "with invalid parameters" do
      fill_in "color", with: "red"
      click_on "Create Capy"
      save_and_open_page
      expect(current_path).to eq("/capys") # user_capys_url(current_user)
      expect(page).to have_content("Name can't be blank")
    end

    scenario "with valid parameters" do
      fill_in "name", with: "Charles"
      fill_in "color", with: "rainbow"
      click_on "Create Capy"
      expect(page).to have_content("Charles")
      expect(current_path).to eq(capy_path(Capy.find_by_name("Charles")))
    end
  end

end
