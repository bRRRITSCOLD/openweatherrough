require 'open-uri'
require 'json'
#require 'pry'

class Current

	attr_accessor :city_input, :country_state_input, :api_key, :city_name, :country_abrv, :request, :response, :parsed, :temperature, :ex_yes_no_input, :units_input, :ex_yes, :ex_no, :units_searcher

	def initialize
		@api_key = "8eef60721040ad22fe6d4b1c96fdfbb7"
		@ex_yes = "yes"
		@ex_no = "no"
		@ex_yes_no_input = @ex_no
		@units_searcher = "&units="
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

	def retrieve
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city_input},#{@country_state_input}&APPID=#{@api_key}#{@units_searcher}#{@units_input}"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
		self.city_name = @parsed['name'].to_s.split(" ").map!(&:capitalize).join(" ")
		self.country_abrv = @parsed['sys']['country'].to_s.upcase
	end

	def city_valid?
		@city_input.downcase == @city_name.downcase
	end

	def ex_yes_no_inputs
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		@ex_yes_no_input = gets.strip.to_s.downcase
	end

	def ex_yes_no_valid?
		@ex_yes_no_input == @ex_yes || @ex_yes_no_input == @ex_no
	end

	def inputs_retrieval_controller
		begin
			self.units_inputs
			self.city_country_state_inputs
			self.retrieve
				if city_valid? !=true 
					puts "\n
						  \n_________________________________________________________________________________
						  \n'#{@city_input}, #{@country_state_input}' is not a valid combination. Please try again.
						  \n_________________________________________________________________________________
						  \n"
					self.city_country_state_inputs
					self.retrieve until city_valid?				
					puts "\n
						  \n___________________________________________________________________________________
						  \nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.
						  \n___________________________________________________________________________________
						  \n"
				else
					puts "\n
						  \n___________________________________________________________________________________
						  \nThe current temperature in #{@city_name}, #{@country_state_input}: #{@temperature}.
						  \n___________________________________________________________________________________
						  \n"
				end
		rescue OpenURI::HTTPError
			puts "\n
				  \n_______________________________________________________________________________________
				  \n'#{@city_input}, #{@country_state_input}' is not a valid combination. Please try again.
				  \n_______________________________________________________________________________________
				  \n"
			self.city_country_state_inputs
		end
	end
		

	def executes
		while @ex_yes_no_input == @ex_no
			self.inputs_retrieval_controller
			self.ex_yes_no_inputs
				if @ex_yes_no_input == @ex_no
					self.inputs_retrieval_controller
					self.ex_yes_no_inputs
				elsif @ex_yes_no_input == @ex_yes
					exit(true)
				else
					puts "\n
						  \n________________________________________________________________________
						  \nYour input of '#{ex_yes_no_input}' was not recognized. Please try again.
						  \n________________________________________________________________________
						  \n"
					self.ex_yes_no_inputs until ex_yes_no_valid?
				end
		end
	end

end

# binding.pry



