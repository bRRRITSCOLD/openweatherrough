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
   			subject.inputs

    		expect(subject.instance_variable_get(:@city)).to eq(:city.capitalize)
      		expect(subject.instance_variable_get(:@country)).to eq(:country.upcase)
    	end
  	end

	  	describe '#current_temperature_retrieval' do
	  	it 'successfully retrieves temperature from api data request' do
	  			json_a = %Q[{"coord":{"lon":-92.64,"lat":41.3},"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}],"base":"stations","main":{"temp":8.63,"pressure":1015,"humidity":45,"temp_min":8,"temp_max":10},"visibility":16093,"wind":{"speed":7.2,"deg":320,"gust":9.8},"clouds":{"all":1},"dt":1508888100,"sys":{"type":1,"id":892,"message":0.1682,"country":"US","sunrise":1508934840,"sunset":1508973271},"id":4870239,"name":"Oskaloosa","cod":200}]
	  			temp = Current.new
	  			temp.city = 'Oskaloosa'
	  			temp.country = 'US'
	  			json_b = JSON.parse(json_a)
	  			json_c = json_b['main']
	  			json_d = json_c['temp']
	  			temp.temperature = json_d.to_f

	  			expect(temp.temperature).to be_an_instance_of(Float)
	  	end
	end

end


	
