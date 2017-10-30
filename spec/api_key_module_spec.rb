require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'
require_relative '../lib/modules/validations_module.rb'
require_relative '../lib/modules/api_key_module.rb'

describe API_KEY do

	describe '#set_api_key' do
	  	it 'sets the users api_key env instance variable to a user defined api_key string or the default/test api_key string provided by developer' do

	  		dummy = Current.new
	  		dummy.set_api_key

	  		expect(dummy.api_key).to be_an_instance_of(String)

	  	end	
	end  	

end