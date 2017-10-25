require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'

json_test = %Q[{"coord":{"lon":-92.64,"lat":41.3},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":8.63,"pressure":1015,"humidity":45,"temp_min":8,"temp_max":10},"visibility":16093,"wind":{"speed":7.2,"deg":320,"gust":9.8},"clouds":{"all":1},"dt":1508888100,"sys":{"type":1,"id":892,"message":0.1682,"country":"US","sunrise":1508934840,"sunset":1508973271},"id":4870239,"name":"Oskaloosa","cod":200}]

describe Current do

	describe '#new' do
		it "creates Current object" do
			temp = Current.new
			expect(temp.class).to eq(Current)
		end
	end

	describe '#inputs' do
		describe '#city_country_state_inputs'
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

	   		it 'sets @city_input and @country_state_input accordingly to user inputs, also capitalizes/upcases inputs' do
	   			subject.city_country_state_inputs

	    		expect(subject.instance_variable_get(:@city_input)).to eq(:city.to_s.capitalize)
	      		expect(subject.instance_variable_get(:@country_state_input)).to eq(:country.to_s.upcase)
	    	end	

  	end

  	describe '#retrieve' do
	  	it 'successfully retrieves temperature from api data request' do
	  			json_a = %Q[{"coord":{"lon":-92.64,"lat":41.3},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":8.63,"pressure":1015,"humidity":45,"temp_min":8,"temp_max":10},"visibility":16093,"wind":{"speed":7.2,"deg":320,"gust":9.8},"clouds":{"all":1},"dt":1508888100,"sys":{"type":1,"id":892,"message":0.1682,"country":"US","sunrise":1508934840,"sunset":1508973271},"id":4870239,"name":"Oskaloosa","cod":200}]
	  			temp = Current.new
	  			temp.city_input = 'Chicago'
	  			temp.country_state_input = 'IL'
	  			json_b = JSON.parse(json_a)
	  			json_c = json_b['main']
	  			json_d = json_c['temp']
	  			temp.temperature = json_d.to_f

	  			expect(temp.temperature).to be_an_instance_of(Float)
	  	end
	end

end


	