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

class Pod < ApplicationRecord
  has_many :teaching_assistant_memberships,
    primary_key: :id,
    foreign_key: :pod_id,
    class_name: :TeachingAssistantMembership

  has_many :teaching_assistants,
    through: :teaching_assistant_memberships,
    source: :teaching_assistant

  belongs_to :pod_leader,
    primary_key: :id,
    foreign_key: :pod_leader_id,
    class_name: :Developer

  has_many :students,
    primary_key: :id,
    foreign_key: :student_pod_id,
    class_name: :Developer
end
