require 'rails_helper'

# model names always singular
RSpec.describe Tweet, type: :model do
  
  it { should validate_presence_of :body }
  it { should belong_to(:author).class_name(User) }
  it { should have_many(:hash_taggings).class_name(HashTagging) }
  it { should have_many(:hash_tags).through(:hash_taggings).class_name(HashTag) }
  
  
end