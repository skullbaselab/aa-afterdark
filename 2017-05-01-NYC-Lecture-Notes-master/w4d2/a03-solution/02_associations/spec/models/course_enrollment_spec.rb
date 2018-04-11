require 'spec_helper'

describe CourseEnrollment do
  subject(:c_e) { CourseEnrollment.first }

  it "has a student" do
    expect(c_e.student.fname).to be_in(["Harry", "Ron", "Hermione"])
  end

  it "has a course" do
    expect(c_e.course.title).to eq("Transfiguration")
  end
end
