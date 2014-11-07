require 'tube_container'

class ContainerHolder; include TubeContainer; end

describe TubeContainer do

  let(:holder) { ContainerHolder.new }
  let(:passenger) { double :passenger }

  it 'should accept passengers' do
    expect { holder.enter(passenger) }.to change { holder.passengers.count }.by 1
  end

  it 'should release passengers' do
    holder.enter(passenger)
    expect { holder.leave(passenger) }.to change { holder.passengers.count }.by -1
  end
end
