# == Schema Information
#
# Table name: technologies
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Technology, type: :model do
  subject(:technology) { Technology.first }

  it 'has technology memberships' do
    expect(technology.memberships.count > 0).to be_truthy
  end

  it 'has many projects' do
    expect(technology.projects).to include(FinalProject.first)
  end
end
