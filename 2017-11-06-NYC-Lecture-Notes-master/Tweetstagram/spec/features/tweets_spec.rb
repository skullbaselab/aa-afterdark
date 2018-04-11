require 'rails_helper'

feature 'tweets' do
  before(:each) do
    login_as_auth_user
  end

  scenario 'creating tweet' do
    visit(new_tweet_url)
    fill_in('body', with: 'new tweet')
    click_on('Create Tweet')
    expect(page).to have_content('new tweet')
  end
end
