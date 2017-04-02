require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it { is_expected.to respond_to :release_bike } # one-liner syntax

    it "releases working bikes" do
      bike = Bike.new
      expect(bike).to be_working
    end

    it "raises error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks something" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it "returns docked bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it "raises error when full" do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to  raise_error "Station is full"
    end
  end

end
