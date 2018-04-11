require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  describe "GET#index" do
    before do
      get :index
    end

    it { should respond_with(200) }
    # works even if we don't explicitly render and let rails do the magic
    it { should render_template(:index) }
  end

  describe "POST#create" do
    before do
      gator = User.create(username: "Gator", password: "starward")
      post :create, {
        cat: { name: "Sennacy" }
      }, session_token: gator.session_token
    end

    it { should respond_with(302) }
    it { should redirect_to(cat_url(Cat.find_by(name: "Sennacy"))) }

    context "with invalid params" do

      before do
        gator = User.create(username: "Gator", password: "starward")
        post :create, { cat: { name: "" } }, session_token: gator.session_token
      end

      it { should respond_with(422) }
      it { should render_template(:new) }
    end
  end
end
