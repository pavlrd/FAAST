require 'coach'
require_relative 'container_shared_examples'

describe Coach do

  it_behaves_like "container"

  COACH_CAPACITY = 40 

  let(:coach)      { Coach.new         }
  let(:passenger)  { double :passenger }
  let(:station)    { double :station   }
  let(:train)      { double :train     }

  it 'has default capacity of passengers' do
    expect(coach.passengers.count).to eq 0
    allow(passenger).to receive(:in_the_tube).and_return true
    expect { coach.board(passenger) }.to change { coach.passengers.count }.by 1
  end

  it 'can hold up to 40 passengers' do
    expect(coach.passengers.count).to eq 0
    allow(passenger).to receive(:in_the_tube).and_return true
    COACH_CAPACITY.times { coach.board(passenger) }
    expect(coach).to be_full
    expect{ coach.board(passenger) }.to raise_error(RuntimeError)
  end
end