require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  
  describe 'POST #create' do
    context 'with good params' do
      before :each do
        location = create(:location)
        user = create(:user, location_id: location.id)
        post :create, params: { tweet: {
          body: 'too much pressure rn',
          author_id: user.id
        }}
      end
      it 'should save the tweet to the database' do
        # no access here to variables declared in before each block
        # we could set instance variable there but we generally wanna steer clear of those in specs
        expect(Tweet.last.body).to eq('too much pressure rn')
        expect(Tweet.last.author).to eq(User.last)
      end
      it 'should redirect to that tweet\'s show page' do
        expect(response).to redirect_to(tweet_url(Tweet.last))
      end
    end
    
    context 'with bad params' do
      before :each do
        location = create(:location)
        user = create(:user, location_id: location.id)
        post :create, params: { tweet: {
          body: '',
          author_id: user.id
        }}
      end
      it 'should populate flash[:errors]' do
        # 
        # include checks that the string includes 'Body can't...'
        # call .first because we need to call it on a string, not the array
        expect(flash[:errors].first).to include('Body can\'t be blank')
      end
      it 'should render the new tweet template' do
        expect(response).to render_template(:new)
      end
    end
  end
  
  describe 'PATCH #update' do
    context 'with good params' do
      before :each do
        user = create(:user, location_id: create(:location).id)
        @tweet = create(:tweet, author_id: user.id)
        patch :update, params: { id: @tweet.id, tweet: {
          body: 'somethin new'
        }}
      end
      
      it 'should update the tweet in the db' do
        # 
        # #find will instantiate a new object
        # @tweet still holds the old, un-updated attributes
        # expect(Tweet.find(@tweet.id)).not_to be(@tweet)
        expect(Tweet.find(@tweet.id).body).to eq('somethin new')
      end
      it 'should redirect to the show page for that tweet' do
        expect(response).to redirect_to(tweet_url(@tweet))
      end
    end
    
    context 'with bad params' do
      before :each do
        user = create(:user, location_id: create(:location).id)
        @tweet = create(:tweet, author_id: user.id)
        patch :update, params: { id: @tweet.id, tweet: {
          body: ''
        }}
      end
      it 'should populate flash[:errors]' do
        expect(flash[:errors].first).to include('Body can\'t be blank')
      end

      it 'should render the edit template' do
        expect(response).to render_template(:edit)
      end
    end
  end
  
end