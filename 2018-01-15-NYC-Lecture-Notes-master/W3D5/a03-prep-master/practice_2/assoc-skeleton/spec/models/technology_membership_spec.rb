# == Schema Information
#
# Table name: technology_memberships
#
#  id               :integer          not null, primary key
#  technology_id    :integer          not null
#  final_project_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe TechnologyMembership, type: :model do
  subject(:membership) { TechnologyMembership.first }

  it 'has a final project' do
    expect(membership.final_project.name).to eq('welp')
  end

  it 'has a technology' do
    expect(membership.technology.name).to eq('React')
  end

  describe 'validations' do
    it 'require that technology memberships have final projects' do
      expect do
        technology = Technology.first
        TechnologyMembership.create!(technology_id: technology.id)
      end.to raise_error.with_message(/must exist/)
    end

    it 'require that technology memberships have technologies' do
      expect do
        final_project = FinalProject.first
        TechnologyMembership.create!(final_project_id: final_project.id)
      end.to raise_error.with_message(/must exist/)
    end
  end
end
