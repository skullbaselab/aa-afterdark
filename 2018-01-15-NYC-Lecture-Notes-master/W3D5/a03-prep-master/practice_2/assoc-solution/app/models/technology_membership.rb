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

class TechnologyMembership < ApplicationRecord
  belongs_to :final_project,
    primary_key: :id,
    foreign_key: :final_project_id,
    class_name: :FinalProject

  belongs_to :technology,
    primary_key: :id,
    foreign_key: :technology_id,
    class_name: :Technology
end
