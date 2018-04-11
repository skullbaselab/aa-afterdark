# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def rand_id
  rand(1..100_000)
end

ActiveRecord::Base.transaction do
  school_id = rand_id

  # professors
  dumbledore = Wizard.create!(
    id: rand_id,
    fname: "Albus",
    lname: "Dumbledore",
    school_id: school_id
  )
  mcgonagall = Wizard.create!(
    id: rand_id,
    fname: "Professor",
    lname: "McGonagall",
    school_id: school_id
  )

  # school
  School.create!(
    id: school_id,
    name: "Hogwarts",
    headmaster_id: dumbledore.id
  )

  # houses
  gryffindor = House.create!(
    id: rand_id,
    name: "Gryffindor",
    master_id: mcgonagall.id,
    building: "The stone one"
  )
  hufflepuff = House.create!(
    id: rand_id,
    name: "Hufflepuff",
    building: "The stone one"
  )

  # students
  harry = Wizard.create!(
    id: rand_id,
    fname: "Harry",
    lname: "Potter",
    house_id: gryffindor.id,
    school_id: school_id
  )
  ron = Wizard.create!(
    id: rand_id,
    fname: "Ron",
    lname: "Weasley",
    house_id: gryffindor.id,
    school_id: school_id
  )
  hermione = Wizard.create!(
    id: rand_id,
    fname: "Hermione",
    lname: "Granger",
    house_id: gryffindor.id,
    school_id: school_id
  )

  transfiguration = Course.create!(
    id: rand_id,
    instructor_id: mcgonagall.id,
    title: "Transfiguration",
    description: "Turning one thing into another thing"
  )

  # enrollments
  CourseEnrollment.create!(id: rand_id, course_id: transfiguration.id, student_id: harry.id)
  CourseEnrollment.create!(id: rand_id, course_id: transfiguration.id, student_id: ron.id)
  CourseEnrollment.create!(id: rand_id, course_id: transfiguration.id, student_id: hermione.id)

  # wands
  first_wand_id = rand_id
  Wand.create!(id: first_wand_id, core_ingredient: "Phoenix Feather", owner_id: harry.id)
  Wand.create!(id: first_wand_id + 1, core_ingredient: "Swag", owner_id: dumbledore.id)
end
