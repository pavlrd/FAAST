require 'coach'

describe Coach do 

  let(:coach)      { Coach.new         }
  let(:passenger)  { double :passenger }
  let(:station)    { double :station   }

  def fill_coach
    40.times { coach.enter(passenger) }
  end

  it 'can take passengers' do
    expect(coach.passengers.count).to eq 0
    coach.enter(passenger)
    expect(coach.passengers.count).to eq 1
  end

  it 'can hold up to 40 passengers' do
    expect(coach.passengers.count).to eq 0
    fill_coach
    expect(coach).to be_full
    expect{ coach.enter(passenger) }.to raise_error(RuntimeError)
  end

  it 'let passenger to alight form coach' do
    coach.enter(passenger)
    expect(coach.passengers.count).to eq 1
    expect(station).to receive(:enter)
    coach.alight(passenger, station)
    expect(coach.passengers.count).to eq 0
  end

  it 'move passenger from train to station' do
    coach.enter(passenger)
    expect(coach.passengers.count).to eq 1
    expect(station).to receive(:enter)
    coach.alight(passenger, station)
    expect(coach.passengers.count).to eq 0
  end
end