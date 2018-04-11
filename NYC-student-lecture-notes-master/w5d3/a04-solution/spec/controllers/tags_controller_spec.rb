require 'rails_helper'

# So specs will run and not throw scary errors before TagsController is implemented
begin
  TagsController
rescue
  TagsController = nil
end

RSpec.describe TagsController, :type => :controller do

  before(:each) do
    allow_message_expectations_on_nil
  end

  describe "POST #create" do
    let(:jack_bruce) { User.create!(username: "jack_bruce", password: "abcdef") }
    let(:jack_post) { Post.create!(title: "neopets", body: "gotta love em", user: jack_bruce)}

    before do
      allow(controller).to receive(:current_user) { jack_bruce }
    end

    context "with invalid params" do
      it "flashes errors" do
        post :create, tag: {post_id: jack_post.id}
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirects to the post show page" do
        post :create, tag: {post_id: jack_post.id, name: "neopets"}
        expect(response).to redirect_to(post_url(jack_post))
      end
    end
  end
end
