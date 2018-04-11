# == Schema Information
#
# Table name: teaching_assistant_memberships
#
#  id                    :integer          not null, primary key
#  teaching_assistant_id :integer          not null
#  pod_id                :integer          not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'rails_helper'

RSpec.describe TeachingAssistantMembership, type: :model do
  subject(:membership) { TeachingAssistantMembership.first }

  it 'has a pod' do
    expect(membership.pod.name).to eq('North Beach')
  end

  it 'has a teaching assistant' do
    expect(membership.teaching_assistant.name).to eq('Luke Wassink')
  end

  describe 'validations' do
    it 'require that a teaching assistant membership has a pod' do
      expect do
        ta = Developer.find_by(name: 'Luke Wassink')
        TeachingAssistantMembership.create!(teaching_assistant_id: ta.id)
      end.to raise_error.with_message(/must exist/)
    end

    it 'require that a teaching assistant membership has a teaching assistant' do
      expect do
        pod = Pod.first
        TeachingAssistantMembership.create!(pod_id: pod.id)
      end.to raise_error.with_message(/must exist/)
    end
  end
end
