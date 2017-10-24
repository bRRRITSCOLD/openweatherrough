require_relative './spec_helper.rb'
require_relative '../lib/current.rb'

describe Current do

	describe '#new' do
		it "creates Current object" do
			temp = Current.new
			expect(temp.class).to eq(Current)
		end
	end

	describe '#inputs' do
		describe '#search_inputs'
		 	before do
		 		io_obj = double
		 	expect(subject)
		 		.to receive(:gets)
		 		.and_return(io_obj)
	        	.twice
			expect(io_obj)
			    .to receive(:strip)
			    .and_return(:city.capitalize)
			expect(io_obj)
	        	.to receive(:strip)
	        	.and_return(:country.upcase)
	    	end

	   		it 'sets @city and @country accordingly to user inputs, also capitalizes/upcases inputs' do
	   			subject.search_inputs

	    		expect(subject.instance_variable_get(:@city_input)).to eq(:city.to_s.capitalize)
	      		expect(subject.instance_variable_get(:@country_input)).to eq(:country.to_s.upcase)
	    	end	

  	end

  	describe '#retrieve' do
	  	it 'successfully retrieves temperature from api data request' do
	  			temp = Current.new
	  			temp.city_input = 'Chicago'
	  			temp.country_input = 'IL'
	  			temp.retrieve

	  			expect(temp.temperature).to be_an_instance_of(Float)
	  	end
	end

end


	