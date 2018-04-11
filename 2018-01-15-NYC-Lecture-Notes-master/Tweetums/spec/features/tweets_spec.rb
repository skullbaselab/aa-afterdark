require 'rails_helper'

# capybara uses feature/scenario instead of describe/it blocks

feature 'create a tweet' do
  before :each do
    create(:user, location_id: create(:location).id)
    visit new_tweet_url
  end

  scenario 'good user input' do
    fill_in('Body', with: 'a good tweet')
    click_on('Create Tweet')
    expect(page).to have_content('a good tweet')
  end

  scenario 'bad user input' do
    fill_in('Body', with: '')
    # click_on will throw an error if there is both a link and button that have the same content
    # use click_link or click_button to be more specific
    click_on('Create Tweet')
    # have_content checks for inclusion; not exclusive
    expect(page).to have_content('Body can\'t be blank')
  end
end

feature 'update a tweet' do
  before :each do
    user = create(:user, location_id: create(:location).id)
    tweet = create(:tweet, author_id: user.id)
    visit edit_tweet_url(tweet)
  end

  scenario 'good user input' do
    fill_in('Body', with: 'valid input')
    click_on('Update Tweet')
    expect(page).to have_content('valid input')
  end

  scenario 'bad user input' do
    fill_in('Body', with: '')
    click_on('Update Tweet')
    expect(page).to have_content('Body can\'t be blank')
  end
end
