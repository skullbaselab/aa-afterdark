require 'rails_helper'

describe "lists", :type => :feature do
  # 'let' is lazy initialized, if not used, it will not be created
  # answer: 'let!' forces code in block to run
  let!(:list) { List.create(title: "Manhattan") }

  scenario "can visit the list index" do
    # we dont use list in any capacity within this scenario
    # therefore, we need let!
    visit('/lists')
    # 'save_and_open_page' helpful method from launchy to open up the current page in
    # the browser in order to see the pages content
    # save_and_open_page
    expect(page).to have_content("ALL THE LISTS")
    expect(page).to have_content("Manhattan")
  end

end
