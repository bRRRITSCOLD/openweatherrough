require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'

json_test_api_response = %Q[{
	  				"coord":{
	  					"lon":-92.64,"lat":41.3
	  					},
	  				"weather":[{
	  					"id":800,
	  					"main":"Clear",
	  					"description":"clear sky",
	  					"icon":"01n"
	  					}],
	  				"base":"stations",
	  				"main":{
	  					"temp":8.63,
	  					"pressure":1015,
	  					"humidity":45,
	  					"temp_min":8,
	  					"temp_max":10
	  					},
	  				"visibility":16093,
	  				"wind":{
	  					"speed":7.2,
	  					"deg":320,
	  					"gust":9.8},
	  					"clouds":{
	  					"all":1
	  					},
	  				"dt":1508888100,
	  				"sys":{
	  					"type":1,
	  					"id":892,
	  					"message":0.1682,
	  					"country":"US",
	  					"sunrise":1508934840,
	  					"sunset":1508973271},
	  					"id":4870239,
	  					"name":"Oskaloosa",
	  					"cod":200
	  				}]

describe Current do

	describe '#new' do
		it "creates Current class object" do
			dummy = Current.new
			expect(dummy.class).to eq(Current)
		end
	end

  	describe '#current_temperature_retrieval' do
	  	it 'successfully retrieves temperature from api data request' do

	  			dummy = Current.new
	  			dummy.city_input = 'Oskaloosa'
	  			dummy.country_state_input = 'IA'
	  			json_parsed = JSON.parse(json_test_api_response)
	  			json_parsed_main = json_parsed['main']
	  			json_parsed_main_temp = json_parsed_main['temp']
	  			dummy.temperature = json_parsed_main_temp.to_f

	  			expect(dummy.temperature).to be_an_instance_of(Float)
	  	end
	end

  	describe '#city_valid?' do
	  	it 'returns true if the user input for city_input matches the returned city_name data from the json api information' do

	  		dummy = Current.new
	  		dummy.city_input = "Oskaloosa".downcase
	  		dummy.city_name = "Oskaloosa".downcase

	  		expect(dummy.city_valid?).to eq(true)

	  	end	
	end  	

	describe '#ex_yes_no_valid?' do
	  	it 'returns true if the ex_yes_no_input (user input) for ex_yes_no_inputs (prompt for exiting program) is either a) "no" or "yes" and no other word besides these two' do

	  		dummy = Current.new
	  		dummy.ex_yes_no_input = "no"
	  		
	  		expect(dummy.ex_yes_no_valid?).to eq(true)

	  		dummy.ex_yes_no_input = "yes"

	  		expect(dummy.ex_yes_no_valid?).to eq(true)

	  	end	
	end  	
	

end


	