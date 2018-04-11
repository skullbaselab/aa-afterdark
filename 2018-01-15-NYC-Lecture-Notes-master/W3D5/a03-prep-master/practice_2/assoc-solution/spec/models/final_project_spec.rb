# == Schema Information
#
# Table name: final_projects
#
#  id            :integer          not null, primary key
#  student_id    :integer          not null
#  supervisor_id :integer          not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe FinalProject, type: :model do
  subject(:project) { FinalProject.first }

  it 'has a student' do
    expect(project.student.name).to eq('Jonathan Lofton')
  end

  it 'has a supervisor teaching assistant' do
    expect(project.supervisor.name).to eq('Luke Wassink')
  end

  it 'has technology memberships' do
    expect(project.technology_memberships.count > 0).to be_truthy
  end

  it 'has associated technologies' do
    expect(project.technologies.count > 0).to be_truthy
  end

  describe 'validations' do
    it 'require that final projects have supervisors' do
      expect do
        pod = Pod.first
        student = Developer.create!(
          name: 'Chris Brickey',
          student_pod_id: pod.id
        )
        FinalProject.create!(student_id: student.id)
      end.to raise_error.with_message(/must exist/)
    end

    it 'require that final projects have a student' do
      expect do
        supervisor = Developer.find_by(name: 'Luke Wassink')
        FinalProject.create!(supervisor_id: supervisor.id)
      end.to raise_error.with_message(/must exist/)
    end
  end
end
