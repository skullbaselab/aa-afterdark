require 'spec_helper'

feature "Subs" do
  feature "subs index" do
    let!(:sub) { create(:sub) }

    scenario "homepage displays all subs" do
      log_in

      # go to /subs
      visit subs_url
      # save_and_open_page

      # page should have "All the Subs"
      expect(page).to have_content("All the Subs")

      # page should have the name of any created subs
      expect(page).to have_content(sub.name)
    end
  end

  feature "creating subs" do
    scenario "requires name and description to be filled in" do
      log_in

      # go to /subs/new
      visit new_sub_url
      # save_and_open_page

      # submit an empty form
      click_on "Submit"
      # save_and_open_page

      # page should have "Name can't be blank"
      expect(page).to have_content("Name can't be blank")

      # page should have "Description can't be blank"
      expect(page).to have_content("Description can't be blank")
    end
  end
end
