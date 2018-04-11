require 'drive_in'
require 'byebug'

describe "DriveIn" do
  subject(:drive_in) { DriveIn.new("The Patio") }
  describe "#initialize" do
    it "has a name" do
      expect(drive_in.name).to eq("The Patio")
    end
    it "sets up an empty cash register" do
      expect(drive_in.cash_register).to be_a(Array)
      expect(drive_in.cash_register).to be_empty
    end
    it "starts as a closed resaurant" do
      expect(drive_in.status).to eq("closed")
    end
  end

  describe "#open" do
    it "opens the store" do
      drive_in.open
      expect(drive_in.status).to eq("open")
    end
  end

  describe "#serve_customer" do
    let(:kelly) { double(:Customer) }
    context "when closed" do
      it "denies the customer" do
        # kelly is referenced
        expect { drive_in.serve_customer(kelly) }.to raise_error("Store is closed!")
      end
    end

    context "when open" do
      before(:each) do 
        drive_in.open
        allow(kelly).to receive(:pay).with(10).and_return(10)
      end

      it "charges the customer money" do
        # kelly is referenced
        # before(:each) runs
        expect(kelly).to receive(:pay).with(10)
        allow(kelly).to receive(:consume)
        drive_in.serve_customer(kelly)
      end
      it "store money in the cash register" do
        # allow(kelly).to receive(:pay).with(10).and_return(10)
        allow(kelly).to receive(:consume)
        drive_in.serve_customer(kelly)
        expect(drive_in.cash_register).to include(10)
      end
      it "serves the customer the daily special" do
        # allow(kelly).to receive(:pay)
        expect(kelly).to receive(:consume).with("Special")
        drive_in.serve_customer(kelly)
      end
    end
  end
end
