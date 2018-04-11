require 'spec_helper'

describe Wizard do

  describe "Student" do
    subject(:harry) { Wizard.find_by_fname("Harry") }

    it "has a house" do
      expect(harry.house.name).to eq("Gryffindor")
    end

    it "goes to school" do
      expect(harry.school.name).to eq("Hogwarts")
    end

    it "reports to one house master" do
      expect(harry.house_master.lname).to eq("McGonagall")
    end

    it "reports to one headmaster" do
      expect(harry.headmaster.lname).to eq("Dumbledore")
    end

    it "chooses the wand (despite what the books say)" do
      expect(harry.wand.core_ingredient).to eq("Phoenix Feather")
    end

    describe "can take a course" do
      let!(:asher) do
        Wizard.create!(
          fname: "Asher",
          lname: "Abramson",
          house_id: House.find_by_name("Hufflepuff").id,
          school_id: School.first.id
        )
      end

      let!(:quidditch) do
        Course.create!(
          instructor_id: asher.id,
          title: "Quidditch Practice",
          description: "Be the flyest in the West"
        )
      end

      let!(:quid_enrollment) do
        CourseEnrollment.create!(
          course_id: quidditch.id,
          student_id: harry.id
        )
      end

      it "and successfully enroll " do
        expect(harry.course_enrollments).to include(quid_enrollment)
      end

      it "and add the course to their list" do
        expect(harry.courses).to include(quidditch)
      end

      it "and learn from their instructor" do
        expect(harry.instructors).to include(asher)
      end
    end


  end

  describe "Instructor" do
    subject(:mcgonagall) {Wizard.find_by_lname("McGonagall")}

    it "teaches courses" do
      transfiguration = Course.find_by_title("Transfiguration")
      expect(mcgonagall.taught_courses).to include(transfiguration)
    end

    it "teaches students" do
      harry = Wizard.find_by_fname("Harry")
      ron = Wizard.find_by_fname("Ron")
      hermy = Wizard.find_by_fname("Hermione")
      expect(mcgonagall.students).to include(harry, ron, hermy)
    end
  end
end
