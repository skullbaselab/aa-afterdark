# spec/features/sub_spec.rb in the Reddit clone

require 'spec_helper'

feature "Subs" do
  feature "subs index" do
    scenario "homepage displays all subs" do
      # go to /subs
      # page should have "All the Subs"
      # page should have the name of any created subs
    end
  end

  feature "creating subs" do
    scenario "requires name and description to be filled in" do
      # go to /subs/new
      # submit an empty form
      # page should have "Name can't be blank"
      # page should have "Description can't be blank"
    end
  end
end


# spec_helper -> refactor log_in method
