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

class Developer < ApplicationRecord
  has_many :teaching_assistant_memberships,
    primary_key: :id,
    foreign_key: :teaching_assistant_id,
    class_name: :TeachingAssistantMembership

  has_many :pods,
    through: :teaching_assistant_memberships,
    source: :pod

  belongs_to :pod,
    primary_key: :id,
    foreign_key: :student_pod_id,
    class_name: :Pod,
    optional: true

  has_one :pod_leader,
    through: :pod,
    source: :pod_leader

  has_many :teaching_assistants,
    through: :pod,
    source: :teaching_assistants

  has_many :students,
    through: :pods,
    source: :students

  has_many :led_circles,
    primary_key: :id,
    foreign_key: :circle_leader_id,
    class_name: :Circle

  belongs_to :circle,
    primary_key: :id,
    foreign_key: :student_circle_id,
    class_name: :Circle,
    optional: true

  has_one :final_project,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :FinalProject

  has_many :supervising_projects,
    primary_key: :id,
    foreign_key: :supervisor_id,
    class_name: :FinalProject

  has_many :technological_skills,
    through: :final_project,
    source: :technologies
end
