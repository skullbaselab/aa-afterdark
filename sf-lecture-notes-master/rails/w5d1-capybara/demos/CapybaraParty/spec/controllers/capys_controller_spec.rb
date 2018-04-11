require 'rails_helper'
begin
  CapysController
rescue
  CapysController = nil
end

RSpec.describe CapysController, :type => :controller do

  describe "GET #index" do
    it "renders the capys index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it "renders the show template" do
      Capy.create!(name: "Corgette", color: "splotchy")
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    context "if the capybara doesn't exist" do
      it "is not a success" do
        begin
          get :show, id: 101
        rescue ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "renders new template" do
        post :create, capy: {name: 'Jeanie'}
        expect(response).to render_template(:new)
      end
    end

    context "with valid params" do
      it "redirects to capys page on success" do
        post :create, capy: {name: 'Joeseph', color: 'maroon'}
        expect(response).to redirect_to(capy_url(Capy.find_by(name: 'Joeseph')))
      end
    end
  end
end
