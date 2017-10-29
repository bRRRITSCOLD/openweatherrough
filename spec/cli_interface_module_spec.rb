require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'

describe CLI do

	describe '#welcome_message' do
		it "Welcome_message puts (displays) via CLI to user" do
			dummy = Current.new
			expect{dummy.welcome_message}.to output("\n------------------------------------\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n____________________________________\n\nWelcome to the Open Weather Map CLI\n\n------------------------------------\nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\n____________________________________\n").to_stdout
		end
	end


	describe '#current_temperature_message' do
		it "Current_temperature_message puts (displays) via CLI to user" do
			dummy = Current.new
			expect{dummy.current_temperature_message}.to output("\n\n_________________________________________________\nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.\n_________________________________________________\n").to_stdout
		end
	end


	describe '#ex_yes_no_invalid_message' do
		it "Ex_yes_no_invalid_message puts (displays) via CLI to user" do
			dummy = Current.new
			expect{dummy.ex_yes_no_invalid_message}.to output("\n\n_________________________________________________________________\nYour input of 'no' was not recognized. Please try again.\n_________________________________________________________________\n").to_stdout
		end
	end

	describe '#city_country_state_inputs_invalid_message' do
		it "City_country_state_inputs_invalid_message puts (displays) via CLI to user" do
			dummy = Current.new
			expect{dummy.city_country_state_inputs_invalid_message}.to output("\n\n_________________________________________________________________________________\n'#{@city_input}, #{@country_state_input}' is not a valid combination. Please try again.\n_________________________________________________________________________________\n").to_stdout
		end
	end
end
