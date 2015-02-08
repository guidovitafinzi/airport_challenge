require 'plane'

describe Plane do

	let(:plane) {Plane.new}
	let(:landed_plane) {Plane.new.landed!}

	it 'has a flying status when created' do
		expect(plane).to be_flying
	end

	it 'has a flying status when in the air' do
		expect(plane.in_the_air!).to be_flying
	end

	it 'changes its status to landed when not flying' do
		expect(plane.landed!).not_to be_flying
	end

	it 'changes its status to flying after taking off' do
		expect(landed_plane.take_off!).to be_flying
	end
end

