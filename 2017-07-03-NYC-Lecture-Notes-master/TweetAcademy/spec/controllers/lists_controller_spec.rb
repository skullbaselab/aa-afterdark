require 'rails_helper'

RSpec.describe ListsController, type: :controller do

  describe "GET#index" do
    before(:each) do
      get :index
    end

    it { should respond_with(200) }
    it { should render_template(:index) }

  end

  describe "GET#show" do

    context "list exists" do

      let (:list) { List.create(title: "Starks") }
      before(:each) do
        get :show, params: { id: list.id }
      end

      it { should respond_with(200) }
      it { should render_template(:show) }
    end

    context "list does not exist" do

      it "fails if record not found" do
        expect { get :show, params: { id: 42 } }.to raise_error(ActiveRecord::RecordNotFound)
      end

    end

  end

  describe "POST#create" do
    context "user is signed in" do
      let(:user) { User.create(username: "Rick Sanchez", password: "morty1") }

      before(:each) do
        post :create, params: {
          list: { title: "Brooklyn", user_id: user.id }
        },
        flash: {},
        session: { session_token: user.session_token }
      end

      it { should respond_with(302) }
      it { should redirect_to(list_url(List.last.id)) }
    end
  end
end
