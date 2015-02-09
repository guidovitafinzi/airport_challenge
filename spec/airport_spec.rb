require 'airport'

describe Airport do

	let(:airport)  { Airport.new     }
	let(:plane)    { double :plane   }

  def fill_airport(airport)
  	airport.capacity.times {airport.land(plane)}
  end

  context 'when created' do
  	before(:each) do
  		allow(airport).to receive(:stormy_weather?).and_return(false)
  	end

  	it 'has no planes' do
  		expect(airport.planes_count).to eq 0
  	end

  	it 'has a default capacity' do
  		expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
  	end

  	it 'can have a custom capacity' do
  		airport = Airport.new(capacity: 30)
  		expect(airport.capacity).to eq 30
  	end
  end

  context 'landing' do
  	before(:each) do
  		allow(airport).to receive(:stormy_weather?).and_return(false)
  		allow(plane).to receive(:land!)
  	end

  	it 'can land a plane' do
  		expect(plane).to receive(:land!)
  		airport.land(plane)
  	end

  	it 'adds a plane after landing' do
  		airport.land(plane)
  		expect(airport.planes_count).to eq 1
  	end
  end

  context 'Taking_off' do
  	before(:each) do
  		allow(airport).to receive(:stormy_weather?).and_return(false)
  		allow(plane).to receive(:land!)
  		allow(plane).to receive(:take_off!)
  	end

			it 'can let a plane take off' do
				airport.land(plane)
				airport.take_off(plane)
			end

			it 'deletes a plane after taking off' do
				expect(plane).to receive (:take_off!)
				airport.land(plane)
				airport.take_off(plane)
				expect(airport.planes_count).to eq 0
			end
	end


	context 'traffic control' do
		before(:each) do
  		allow(airport).to receive(:stormy_weather?).and_return(false)
  		allow(plane).to receive(:land!)
  	end

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
		before(:each) do
			allow(airport).to receive(:stormy_weather?).and_return(true)
		end

		it 'a plane cannot take off if there is a storm brewing' do
			expect(lambda { airport.take_off(plane) }).to raise_error(RuntimeError, "Take off permission denied")
		end

		it 'a plane cannot land in a middle of a storm' do
			expect(lambda { airport.land(plane) }).to raise_error(RuntimeError, "Land permission denied")
		end
	end
end




