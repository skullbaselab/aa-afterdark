require 'rails_helper'

RSpec.feature "Cats", type: :feature do
  feature "Creating Cats" do
    scenario "When user fills out form well" do
      # helper method from spec_helper
      sign_in_as_gatordos
      visit(new_cat_url)
      expect(page).to have_content("New Cat")
      fill_in("Name", with: "Sennacy")
      click_on("Create cat!")
      expect(page).to have_content("Sennacy")
      # opens a snapshot of the page we're on in the test
    end
  end
end
