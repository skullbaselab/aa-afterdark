require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  
  describe 'GET #new' do
    it 'should render the new template' do
      get :new 
      expect(response).to render_template :new
    end
  end
  
  describe 'POST #create' do
    context 'with good params' do 
      before :each do
        location = create(:location)
        post :create, params: { user: {
          username: 'good_user',
          password: 'starwars',
          location_id: location.id
        }}
      end
      it 'should save the user to the db' do
        expect(User.last.username).to eq('good_user')
      end
      it 'should redirect to tweets index' do
        expect(response).to redirect_to(tweets_url)
      end
    end
    
    context 'with bad params' do
      before :each do 
        location = create(:location)
        post :create, params: { user: {
          username: 'bad_user',
          password: 'short',
          location_id: location.id
        }}
      end
      it 'should populate flash[:errors]' do
        expect(flash[:errors]).to_not be_nil
        expect(flash[:errors]).to be_present
        expect(flash[:errors].first).to include('Password is too short')
      end
      it 'should redirect to users :new' do
        expect(response.status).to eq(302)
        expect(response).to redirect_to(new_user_url)
      end
    end
  end
  
end