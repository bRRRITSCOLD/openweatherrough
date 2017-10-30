require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'

describe CLI do

	describe '#welcome_message' do
		it "Welcome_message puts (displays) via CLI to user" do

		# \n------------------------------------
		# \nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		# \n____________________________________
		# \n
		# \nWelcome to the Open Weather Map CLI
		# \n
		# \n------------------------------------
		# \nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
		# \n____________________________________
		# \n

			dummy = Current.new
			expect{dummy.welcome_message}.to output("\n------------------------------------\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n____________________________________\n\nWelcome to the Open Weather Map CLI\n\n------------------------------------\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n____________________________________\n").to_stdout
		end
	end


	describe '#current_temperature_message' do
		it "Current_temperature_message puts (displays) via CLI to user" do

		# \n
		# \n_________________________________________________
		# \nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.
		# \n_________________________________________________
		# \n

			dummy = Current.new
			expect{dummy.current_temperature_message}.to output("\n\n_________________________________________________\nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.\n_________________________________________________\n").to_stdout
		end
	end

	describe '#city_country_state_inputs' do
		
			dummy = Current.new

		 	before do
		 		io_obj = double
		 	expect(dummy)
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

   		it 'City_input and country_state_input accordingly to user inputs, also capitalizes/upcases inputs' do

   		# \n
		# \n__________________	
		# \nEnter a City Name:
		# \n__________________
		# \n

		# \n
		# \n__________________________________________________
    	# \nEnter a Country or USA State Code:
		# \n\t- Country Code Example: US, UK, FR, Etc.
		# \n\t- USA State Code Example: IA, IL, MN, Etc.
		# \n__________________________________________________
		# \n

   			dummy.city_country_state_inputs

    		expect(dummy.instance_variable_get(:@city_input)).to eq(:city.to_s.capitalize)
      		expect(dummy.instance_variable_get(:@country_state_input)).to eq(:country.to_s.upcase)
	    	end	
	end


	describe '#ex_yes_no_invalid_message' do
		it "Ex_yes_no_invalid_message puts (displays) via CLI to user" do

		# \n
		# \n_________________________________________________________________
		# \nYour input of '#{@ex_yes_no_input}' was not recognized. Please try again.
		# \n_________________________________________________________________
		# \n
			
			dummy = Current.new
			dummy.ex_yes_no_invalid_message
			allow($stdout).to receive(:puts)
		end
	end

	describe '#city_country_state_inputs_invalid_message' do
		it "City_country_state_inputs_invalid_message puts (displays) via CLI to user" do

		# \n
		# \n_________________________________________________________________________________
		# \n'#{@city_input}, #{@country_state_input}' is not a valid combination. Please try again.
		# \n_________________________________________________________________________________
		# \n	
		
			dummy = Current.new
			dummy.city_country_state_inputs_invalid_message
			allow($stdout).to receive(:puts)
		end
	end
end
