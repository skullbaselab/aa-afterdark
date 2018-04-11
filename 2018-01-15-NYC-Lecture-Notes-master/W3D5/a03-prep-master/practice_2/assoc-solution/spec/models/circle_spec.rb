# == Schema Information
#
# Table name: circles
#
#  id               :integer          not null, primary key
#  circle_leader_id :integer          not null
#  pod_id           :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Circle, type: :model do
  subject(:circle) { Circle.first }

  it 'has a pod' do
    expect(circle.pod.name).to eq('North Beach')
  end

  it 'has students' do
    expect(circle.students.count > 0).to be_truthy
  end

  it 'has a circle leader' do
    expect(circle.circle_leader.name).to eq('Luke Wassink')
  end

  describe 'validations' do
    it 'require circle to have a pod' do
      expect do
        circle_leader = Developer.first
        Circle.create!(circle_leader_id: circle_leader.id)
      end.to raise_error.with_message(/must exist/)
    end

    it 'require circle to have a circle leader' do
      expect do
        pod = Pod.first
        Circle.create!(pod_id: pod.id)
      end.to raise_error.with_message(/must exist/)
    end
  end
end
