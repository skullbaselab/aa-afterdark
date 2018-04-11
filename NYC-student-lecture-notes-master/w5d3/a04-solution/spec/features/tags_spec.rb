require 'rails_helper'

feature "Adding tags (hint: make sure your capitalization is exact!)", type: :feature  do
  before :each do
    sign_up_as_jack_bruce
  end

  it "has an add tag form on the post show page" do
    make_post
    expect(page).to have_content 'Tag Name'
    expect(page).to have_button 'Add Tag'
  end

  it "shows the post show page on submit" do
    make_post
    fill_in 'Tag Name', with: 'taggerific'
    click_button 'Add Tag'
    expect(current_path).to eq(post_path(Post.last))
  end

  it "adds the tag to the tag list on clicking the submit button" do
    make_post
    fill_in 'Tag Name', with: 'taggerific'
    click_button 'Add Tag'
    expect(page).to have_content 'taggerific'
  end
end

feature "Deleting tags" do
  before :each do
    sign_up_as_jack_bruce
    make_post
    add_tag
  end

  it "displays a remove button next to each tag" do
    expect(page).to have_button 'Remove Tag'
  end

  it "shows the post show page on click" do
    click_button 'Remove Tag'
    expect(page).to have_content 'jack_bruce'
    expect(page).to have_content 'My First Post'
  end

  it "removes the tag on click" do
    click_button 'Remove Tag'
    expect(page).to have_content 'My First Post'
    expect(page).to_not have_content 'taggerific'
  end
end
