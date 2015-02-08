require 'airport'
require 'plane'

describe Airport do

	let(:airport) {Airport.new(capacity: 2)}
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

		# Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

	context 'weather condition' do
		it 'a plane cannot take off if there is a storm brewing' do
		end

		it 'a plane cannot land in a middle of a storm' do
		end
	end
end




