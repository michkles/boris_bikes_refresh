require 'docking_station'

describe DockingStation do

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Station is full'
    end
  end

  describe '#release_bike' do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it { is_expected.to respond_to :release_bike } # one-liner syntax

    let(:bike) { double :bike, working?: true }
    it "releases working bikes" do
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end

    it "raises error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "does not release broken bikes" do
      bike = double(:bike, working?: false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe '#dock' do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it "docks something" do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end

    it "raises error when full" do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to  raise_error "Station is full"
    end
  end

end
