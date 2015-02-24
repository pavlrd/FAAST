require 'spec_helper'
require 'container'

shared_examples 'container' do
  let(:container) { described_class.new }
  let(:passenger) { double :passenger   }

  it 'should let passengers to enter' do
    expect { container.enter(passenger) }.to change { container.passengers.count }.by 1
  end

  it 'should let passenger to leave' do
    container.enter(passenger)
    expect { container.leave(passenger) }.to change { container.passengers.count }.by(-1)
  end
end
