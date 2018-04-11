require 'rails_helper'

# So specs will run and not throw scary errors before PostsController is implemented
begin
  PostsController
rescue
  PostsController = nil
end

RSpec.describe PostsController, :type => :controller do
  let(:jack) { User.create!(username: 'jack_bruce', password: 'abcdef') }

  before(:each) do
    allow_message_expectations_on_nil
  end
  
  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "renders the new posts page" do
        get :new, post: {}
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #index" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end


  describe "PATCH #update" do
    context "when logged in as a different user" do
      create_jill_with_post

      before do
        allow(controller).to receive(:current_user) { jack }
      end

      it "should not allow users to update another users posts" do
        begin
          patch :update, id: jill_post, post: {title: "Jack Hax"}
        rescue ActiveRecord::RecordNotFound
        end

        edited_post = Post.find(jill_post.id)
        expect(edited_post.title).to eq("Jill Post")
      end
    end
  end

  describe "POST #create" do

    before do
      allow(controller).to receive(:current_user) { jack }
    end

    context "with invalid params" do
      it "validates the presence of title and body" do
        post :create, post: {body: "this is an invalid post"}
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects to the post show page" do
        post :create, post: {title: "teehee", body: "haha this post is funny"}
        expect(response).to redirect_to(post_url(Post.last))
      end
    end
  end
end
