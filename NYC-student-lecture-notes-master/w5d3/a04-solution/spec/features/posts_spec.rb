require 'rails_helper'

feature "Creating a post (hint: make sure your capitalization is exact!)", type: :feature  do
  context "when logged in" do
    before :each do
      sign_up_as_jack_bruce
      visit new_post_path
    end

    it "takes a title and a body" do
      expect(page).to have_content 'Title'
      expect(page).to have_content 'Body'
    end

    context "on failed save" do
      before :each do
        make_post("", "La di da")
      end

      it "has a pre-filled form (with the data previously input)" do
        expect(find_field('Body').value).to eq('La di da')
      end

      it "still allows for a successful save" do
        fill_in 'Title', with: 'My First Post'
        click_button 'Create New Post'
        expect(page).to have_content 'My First Post'
      end
    end
  end
end

feature "Seeing all posts" do
  context "when logged in" do
    before :each do
      sign_up_as_jack_bruce
      make_post('My First Post')
      make_post('My Second Post')
      visit posts_path
    end

    it "shows all the posts for the current user" do
      expect(page).to have_content 'My First Post'
      expect(page).to have_content 'My Second Post'
    end

    it "links to each of the posts with the post titles" do
      click_link 'My First Post'
      expect(page).to have_content 'My First Post'
      expect(page).to_not have_content('My Second Post')
    end
  end

  context "when signed in as another user" do
    let(:jackie_chan) { User.create!(username: "jackie_chan", password: "abcdef") }
    let(:karate_post) { Post.create!(user: jackie_chan, title: "Karate", body: "Is the best") }

    before :each do
      karate_post
      sign_up('jack_bruce')
    end

    it "does not show others posts" do
      visit posts_path
      expect(page).not_to have_content('Karate')
    end
  end
end

feature "Showing a post" do
  context "when logged in" do
    before :each do
      sign_up('jack_bruce')
      make_post('Hello, World!')
      visit posts_path
      click_link 'Hello, World!'
    end

    it "displays the post title" do
      expect(page).to have_content 'Hello, World!'
    end

    it "displays the post body" do
      expect(page).to have_content 'The body of a post is rad.'
    end

    it "displays the author username" do
      expect(page).to have_content('jack_bruce', count: 2)
    end
  end
end

feature "Editing a post" do
  before :each do
    sign_up_as_jack_bruce
    make_post('This is a title')
    visit posts_path
    click_link 'This is a title'
  end

  it "has a link on the show page to edit a post" do
    expect(page).to have_content 'Edit Post'
  end

  it "shows a form to edit the post" do
    click_link 'Edit Post'
    expect(page).to have_content 'Title'
    expect(page).to have_content 'Body'
  end

  it "has all the data pre-filled" do
    click_link 'Edit Post'
    expect(find_field('Title').value).to eq('This is a title')
    expect(find_field('Body').value).to eq('The body of a post is rad.')
  end

  context "on successful update" do
    let!(:show_page) { current_path }

    before :each do
      click_link 'Edit Post'
    end

    it "redirects to the post show page" do
      fill_in 'Title', with: 'A new title'
      click_button 'Update Post'
      expect(page).to have_content 'A new title'
      # Disallow creation of a new Post
      expect(current_path).to eq(show_page)
    end
  end

  context "on a failed update" do
    let!(:show_page) { current_path }

    before :each do
      click_link 'Edit Post'
    end

    it "returns to the edit page" do
      fill_in 'Title', with: ''
      click_button 'Update Post'

      # failed; should be able to try again
      fill_in 'Title', with: 'Ginger Baker'
      click_button 'Update Post'

      expect(current_path).to eq(show_page)
      expect(page).to have_content("Ginger Baker")
    end

    it "preserves the attempted updated data" do
      fill_in 'Title', with: ''
      click_button 'Update Post'

      expect(find_field('Title').value).to eq("")
    end
  end
end
