require 'docking_station'

describe DockingStation do

  it "should release a bike" do
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to :release_bike }
end
