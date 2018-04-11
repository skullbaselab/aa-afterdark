require 'rails_helper'

RSpec.describe TweetsController, type: :controller do

  describe 'GET #index' do
    it 'renders the index page' do
      # get method makes a get request
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    before(:each) do
      u = FactoryBot.build(:user)
      allow(subject).to receive(:current_user).and_return(u)
    end
    context 'with valid params' do
      it 'redirects to index page' do
        post :create, params: {tweet: {body: 'newtweet'}}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(tweets_url)
      end
    end

    context 'with invalid params' do
      it 'renders the new template and populates flash errors' do
        post :create, params: {tweet: {body: ''}}
        expect(response).to render_template(:new)
        expect(flash.now[:errors]).to eq(["Body can't be blank"])
      end
    end
  end
end
