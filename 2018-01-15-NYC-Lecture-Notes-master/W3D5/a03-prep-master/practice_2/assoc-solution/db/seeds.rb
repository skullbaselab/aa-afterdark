# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  puts 'Beginning to seed'

  Developer.destroy_all
  Pod.destroy_all
  TeachingAssistantMembership.destroy_all
  Circle.destroy_all
  FinalProject.destroy_all
  TechnologyMembership.destroy_all
  Technology.destroy_all

  ta = Developer.create!(name: 'Luke Wassink')
  pod = Pod.create!(name: 'North Beach', pod_leader_id: ta.id, coolness_rating: 10)
  teaching_assistant_membership = TeachingAssistantMembership.create!(teaching_assistant_id: ta.id, pod_id: pod.id)
  circle = Circle.create!(circle_leader_id: ta.id, pod_id: pod.id)
  student = Developer.create!(name: 'Jonathan Lofton', student_pod_id: pod.id, student_circle_id: circle.id)
  final_project = FinalProject.create!(name: 'welp', student_id: student.id, supervisor_id: ta.id)
  technology = Technology.create!(name: 'React')
  technology_membership = TechnologyMembership.create!(technology_id: technology.id, final_project_id: final_project.id)

  puts 'Finished seeding'
end
