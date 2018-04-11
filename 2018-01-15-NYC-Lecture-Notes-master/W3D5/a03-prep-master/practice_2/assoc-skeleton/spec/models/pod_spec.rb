# == Schema Information
#
# Table name: pods
#
#  id              :integer          not null, primary key
#  pod_leader_id   :integer          not null
#  name            :string           not null
#  coolness_rating :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe Pod, type: :model do
  subject(:pod) { Pod.find_by(name: 'North Beach') }

  it 'has teaching assistant memberships' do
    memberships = pod.teaching_assistant_memberships
    expect(memberships.count > 0).to be_truthy
  end

  it 'has teaching assistants' do
    expect(pod.teaching_assistants.count > 0).to be_truthy
  end

  it 'has a pod leader' do
    expect(pod.pod_leader.name).to eq('Luke Wassink')
  end

  it 'has many students' do
    expect(pod.students.count > 0).to be_truthy
  end

  describe 'validations' do
    it 'require the pod to have a pod leader' do
      expect do
        coolness_rating = Pod.maximum(:coolness_rating) ** 2
        Pod.create!(name: 'Mission', coolness_rating: coolness_rating)
      end.to raise_error.with_message(/must exist/)
    end
  end
end
