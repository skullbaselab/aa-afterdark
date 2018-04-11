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

class TeachingAssistantMembership < ApplicationRecord
  belongs_to :pod,
    primary_key: :id,
    foreign_key: :pod_id,
    class_name: :Pod

  belongs_to :teaching_assistant,
    primary_key: :id,
    foreign_key: :teaching_assistant_id,
    class_name: :Developer
end
