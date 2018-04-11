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
end
