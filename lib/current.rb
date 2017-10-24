require 'open-uri'
require 'json'
#require 'pry'

class Current

	attr_accessor :city_input, :country_input, :api_key, :city_name, :country_abrv, :request, :response, :parsed, :temperature, :exorcon, :units, :ex, :con, :units_searcher

	def initialize
		self.api_key = "8eef60721040ad22fe6d4b1c96fdfbb7"
		self.ex = "yes"
		self.con = "no"
		self.exorcon = self.con
		self.units_searcher = "&units="
	end

	def search_inputs
		puts "\n
			  \n__________________	
			  \nEnter a City Name:
			  \n__________________
			  \n"
		self.city_input = gets.strip.to_s.capitalize
		puts "\n
			  \n__________________________________________________
			  \nEnter a Country or USA State Code:
			  \n\t- Country Code Example: US, UK, FR, Etc.
			  \n\t- USA State Code Example: IA, IL, MN, Etc.
			  \n__________________________________________________
			  \n"
		self.country_input = gets.strip.to_s.upcase
	end	

	def units_input
		puts "\n
			  \n________________________________________________________________________________________________________________________
			  \nEnter the desired unit class of measurement desired for current temperature:
			  \n\t- Typing 'standard', 'default' or 'any word != imperial or metric' induces the selection of Standard (Kelvin)
			  \n\t- Typing 'imperial' induces the selection of Imperial (Fahrenheit)
			  \n\t- Typing 'metric' induces the selection of Metric (Celsius)
			  \n________________________________________________________________________________________________________________________
			  \n"
		self.units = gets.strip.to_str.downcase
	end

	def retrieve
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city_input},#{@country_input}&APPID=#{@api_key}#{@units_searcher}#{@units}"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
		self.city_name = @parsed['name'].to_s
		self.country_abrv = @parsed['sys']['country'].to_s
	end

	def city_valid?
		@city_input == @city_name
	end

	def exorcon_input
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		self.exorcon = gets.strip.downcase
	end

	def inputs_retrieval_controller
		begin
			self.units_input
			self.search_inputs
			self.retrieve
				if city_valid? !=true 
					puts "\n
						  \n_____________________________________________________________
						  \n#{@city_input}, #{@country_input} is not a valid combination.
						  \n_____________________________________________________________
						  \n"
					self.search_inputs
					self.retrieve until city_valid?				
					puts "\n
						  \n_____________________________________________________________________________
						  \nThe current temperature in #{@city_name}, #{@country_input}: #{@temperature}.
						  \n_____________________________________________________________________________
						  \n"
				else
					puts "\n
						  \n_____________________________________________________________________________
						  \nThe current temperature in #{@city_name}, #{@country_input}: #{@temperature}.
						  \n_____________________________________________________________________________
						  \n"
				end
		rescue OpenURI::HTTPError
			puts "\n
				  \n_____________________________________________________________
				  \n#{@city_input}, #{@country_input} is not a valid combination.
				  \n_____________________________________________________________
				  \n"
			self.search_inputs
		end
	end
		

	def executes
		while self.exorcon == self.con
			self.inputs_retrieval_controller
			self.exorcon_input
				if self.exorcon == self.con
					self.inputs_retrieval_controller
					self.exorcon_input
				elsif self.exorcon == self.ex
					exit(true)
				end
		end
	end

end

# binding.pry



