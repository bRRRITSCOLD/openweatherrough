module CLI

	def welcome_message
		puts "\n------------------------------------
			  \nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
			  \n____________________________________
			  \n
			  \nWelcome to the Open Weather Map CLI
			  \n
			  \n------------------------------------
			  \nxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
			  \n____________________________________"
	end

	def units_inputs
		puts "\n
			  \n________________________________________________________________________________________________________________________
			  \nEnter the desired unit class of measurement desired for current temperature:
			  \n\t- Typing 'standard', 'default' or 'any word != imperial or metric' induces the selection of Standard (Kelvin)
			  \n\t- Typing 'imperial' induces the selection of Imperial (Fahrenheit)
			  \n\t- Typing 'metric' induces the selection of Metric (Celsius)
			  \n________________________________________________________________________________________________________________________
			  \n"
		@units_input = gets.strip.to_s.downcase
	end


	def city_country_state_inputs
		puts "\n
			  \n__________________	
			  \nEnter a City Name:
			  \n__________________
			  \n"
		@city_input = gets.strip.to_s.split(" ").map!(&:capitalize).join(" ")
		puts "\n
			  \n__________________________________________________
			  \nEnter a Country or USA State Code:
			  \n\t- Country Code Example: US, UK, FR, Etc.
			  \n\t- USA State Code Example: IA, IL, MN, Etc.
			  \n__________________________________________________
			  \n"
		@country_state_input = gets.strip.to_s.upcase
	end	

	def current_temperature_message
		puts "\n
			  \n_________________________________________________
			  \nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.
			  \n_________________________________________________
			  \n"
	end

	def ex_yes_no_inputs
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		@ex_yes_no_input = gets.strip.to_s.downcase
	end

	def ex_yes_no_invalid_message
		puts "\n
			  \n_________________________________________________________________
			  \nYour input of '#{@ex_yes_no_input}' was not recognized. Please try again.
			  \n_________________________________________________________________
			  \n"
	end

	def city_country_state_inputs_invalid_message
		puts "\n
			  \n_________________________________________________________________________________
			  \n'#{@city_input}, #{@country_input}' is not a valid combination. Please try again.
			  \n_________________________________________________________________________________
			  \n"
	end
end





