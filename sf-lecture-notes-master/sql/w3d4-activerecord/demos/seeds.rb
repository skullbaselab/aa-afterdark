ActiveRecord::Base.transaction do
  User.destroy_all

  # Instructors
  aj = User.create!(name: 'AJ')
  anastassia = User.create!(name: 'Anastassia')
  ned = User.create!(name: "Ned")

  Course.destroy_all
  ruby101 = Course.create!(name: 'Ruby 101', instructor_id: ned.id)
  ruby102 = Course.create!(name: 'Ruby 102', instructor_id: ned.id, prereq_id: ruby101.id)
  ruby103 = Course.create!(name: 'Ruby 103', instructor_id: aj.id, prereq_id: ruby102.id)
  ruby104 = Course.create!(name: 'Ruby 104', instructor_id: aj.id, prereq_id: ruby103.id)

  sql101 = Course.create!(name: 'SQL 101', instructor_id: anastassia.id)
  sql102 = Course.create!(name: 'SQL 102', instructor_id: anastassia.id, prereq_id: sql101.id)
  sql103 = Course.create!(name: 'SQL 103', instructor_id: anastassia.id, prereq_id: sql102.id)
  sql104 = Course.create!(name: 'SQL 104', instructor_id: anastassia.id, prereq_id: sql103.id)

  Enrollment.destroy_all

  # Students and enrollments
  flarnie = User.create!(name: 'Flarnie', grade: "FR")
  Enrollment.create!(student_id: flarnie.id, course_id: ruby101.id)
  Enrollment.create!(student_id: flarnie.id, course_id: sql101.id)

  georges = User.create!(name: 'Georges St. Pierre', grade: "FR")
  Enrollment.create!(student_id: georges.id, course_id: ruby101.id)
  Enrollment.create!(student_id: georges.id, course_id: ruby102.id)

  aaron = User.create!(name: 'Aaron', grade: "SO")
  Enrollment.create!(student_id: aaron.id, course_id: ruby102.id)
  Enrollment.create!(student_id: aaron.id, course_id: sql101.id)

  elliot = User.create!(name: 'Elliot', grade: "SO")
  Enrollment.create!(student_id: elliot.id, course_id: sql102.id)
  Enrollment.create!(student_id: elliot.id, course_id: ruby103.id)

  jesse = User.create!(name: 'Jesse', grade: "JR")
  Enrollment.create!(student_id: jesse.id, course_id: sql102.id)
  Enrollment.create!(student_id: jesse.id, course_id: ruby104.id)
  Enrollment.create!(student_id: jesse.id, course_id: ruby103.id)

  andres = User.create!(name: 'Andres', grade: "JR")
  Enrollment.create!(student_id: andres.id, course_id: sql101.id)
  Enrollment.create!(student_id: andres.id, course_id: ruby104.id)
  Enrollment.create!(student_id: andres.id, course_id: ruby103.id)

  david = User.create!(name: 'David', grade: "SR")
  Enrollment.create!(student_id: david.id, course_id: sql103.id)
  Enrollment.create!(student_id: david.id, course_id: ruby104.id)

  cynthia = User.create!(name: 'Cynthia', grade: "SR")
  Enrollment.create!(student_id: cynthia.id, course_id: ruby103.id)
  Enrollment.create!(student_id: cynthia.id, course_id: sql102.id)
end
