# == Schema Information
#
# Table name: developers
#
#  id                :integer          not null, primary key
#  student_pod_id    :integer
#  student_circle_id :integer
#  name              :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Developer, type: :model do
  describe 'teaching assistant' do
    subject(:ta) { Developer.find_by(name: 'Luke Wassink') }

    it 'has teaching assistant memberships' do
      memberships = ta.teaching_assistant_memberships
      expect(memberships.count > 0).to be_truthy
    end

    it 'has pods' do
      expect(ta.pods.count > 0).to be_truthy
    end
  end

  describe 'student' do
    subject(:student) { Developer.find_by(name: 'Jonathan Lofton') }

    it 'has a pod' do
      expect(student.pod.name).to eq('North Beach')
    end

    it 'has a pod leader' do
      expect(student.pod_leader.name).to eq('Luke Wassink')
    end
  end

  describe 'teaching assistant' do
    subject(:ta) { Developer.find_by(name: 'Luke Wassink') }

    it 'has many students through pods' do
      expect(ta.students.count > 0).to be_truthy
    end

    it 'has a circle that they lead' do
      expect(ta.led_circles.count > 0).to be_truthy
    end

    describe 'validations' do
      it 'allow developer to optionally have a circle id' do
        expect do
          pod = Pod.first
          Developer.create!(name: 'Debra Fong', student_pod_id: pod.id)
        end.to_not raise_error
      end

      it 'allow developer to optionally have a pod id' do
        expect do
          circle = Circle.first
          Developer.create!(name: 'Debra Fong', student_circle_id: circle.id)
        end.to_not raise_error
      end
    end
  end

  describe 'student' do
    subject(:student) { Developer.find_by(name: 'Jonathan Lofton') }

    it 'has a circle' do
      expect(student.circle).to eq(Circle.first)
    end

    it 'has a final project' do
      expect(student.final_project.name).to eq('welp')
    end
  end

  describe 'teaching assistant' do
    subject(:ta) { Developer.find_by(name: 'Luke Wassink') }

    it 'has supervising projects' do
      expect(ta.supervising_projects.count > 0).to be_truthy
    end
  end

  describe 'student' do
    subject(:student) { Developer.find_by(name: 'Jonathan Lofton') }

    it 'has technological skills' do
      expect(student.technological_skills).to include(Technology.find_by(name: 'React'))
    end
  end
end
