require 'bike'

describe Bike do
  it "should respond to release_bike method" do
    expect(subject).to respond_to :working?
  end

  it { is_expected.to respond_to :working? } # one-liner syntax

  it "can be reported as broken" do
    subject.report_broken
    expect(subject).to be_broken
  end
end
