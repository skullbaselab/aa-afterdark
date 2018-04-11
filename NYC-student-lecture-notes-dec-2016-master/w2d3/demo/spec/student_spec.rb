require 'student'

describe Student do
  subject(:student) { Student.new("Tommy", "Duek") }

  describe "attributes" do
    it "should respond to #fname" do
      expect(student.fname).to eq("Tommy")
    end

    it "should respond to #lname" do
      expect(student.lname).to eq("Duek")
    end

    it "should default to empty courses" do
      expect(student.courses).to eq([])
    end

    it "should allow fname to be set" do
      student.fname = "Thomas"
      expect(student.fname).to eq("Thomas")
    end

    it "should allow lname to be set" do
      student.lname = "Pickles"
      expect(student.lname).to eq("Pickles")
    end
  end

  describe "#fullname" do
    it "returns the student's full name" do
      expect(student.fullname).to eq("Tommy Duek")
    end

    it "correctly returns full name after name change" do
      student.lname = "Pickles"
      expect(student.fullname).to eq("Tommy Pickles")
    end
  end

  describe "#enroll" do
    let(:course) { double("course", at_capacity?: false) }

    context "when course is not at capacity" do
      it "adds a course to student's courses" do
        student.enroll(course)

        expect(student.courses).to include(course)
      end
    end

    context "when course is at capacity" do
      it "does not enroll student" do
        expect(course).to receive(:at_capacity?).and_return(true)
        student.enroll(course)

        expect(student.courses).to be_empty
      end
    end


  end

  def error_raiser(name)
    raise name
    true
  end

  describe '#error_raiser' do
    it 'has a pending spec'

    it 'should raise an error' do
      expect { error_raiser('raise') }.to raise_error(ArgumentError)
    end

  end
end
