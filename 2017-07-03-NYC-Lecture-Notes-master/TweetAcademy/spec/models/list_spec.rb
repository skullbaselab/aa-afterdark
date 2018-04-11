require 'rails_helper'

RSpec.describe List, type: :model do

  subject (:list) { List.create( title: "Lannisters" ) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  it { should have_many(:user_listings) }
  it { should have_many(:users).through(:user_listings) }


end
