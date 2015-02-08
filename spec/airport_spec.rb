require 'airport'

describe Airport do

	include Weather

	let(:airport) {Airport.new}
	let(:plane) {double :plane}

  def fill_airport(airport)
  	airport.capacity.times {airport.land(plane)}
  end

	context 'taking off and landing' do

		it 'a plane can land' do
			expect(airport.planes_count).to eq(0)
			airport.land(plane)
			# expect(airport.planes).to eq [plane]
			expect(airport.planes_count).to eq(1)
		end

		it 'a plane can take off' do
			airport.land(plane)
			airport.take_off(plane)
			# expect(airport.planes).to eq []
			expect(airport.planes_count).to eq(0)
		end
	end

	context 'traffic control' do

		it 'should know when it\'s full' do
			expect(airport).not_to be_full
			fill_airport airport
			expect(airport).to be_full
		end

		it 'a plane cannot land if the airport is full' do
			fill_airport airport
			expect{ airport.land(plane) }.to raise_error(RuntimeError, "Airport is full")
		end
	end

	context 'weather condition' do
		it 'a plane cannot take off if there is a storm brewing' do
			allow(airport).to receive(:weather_rand).and_return("stormy")
			expect(lambda { airport.take_off(plane) }).to raise_error(RuntimeError, "Take off permission denied")
		end

		xit 'a plane cannot land in a middle of a storm' do
			allow(airport).to receive(:weather_rand).and_return("stormy")
			expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, "Land permission denied")
		end
	end

end




