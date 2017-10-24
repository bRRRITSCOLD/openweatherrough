require 'open-uri'
require 'json'
# require 'pry'

class Current

	attr_accessor :city, :country, :api_key, :api_holder, :request, :response, :parsed, :temperature, :exorcon, :units, :units_searcher

	def initialize
		self.api_key = "8eef60721040ad22fe6d4b1c96fdfbb7"
		self.exorcon = "no"
		self.units = "imperial"
		self.units_searcher = "&units="
	end

	def search_inputs
		puts "\n
			  \n__________________	
			  \nEnter a City Name:
			  \n__________________
			  \n"
		self.city = gets.strip.capitalize
		puts "\n
			  \n__________________________________________________
			  \nEnter a Country or USA State Code:
			  \n\t- Country Code Example: US, UK, FR, Etc.
			  \n\t- USA State Code Example: IA, IL, MN, Etc.
			  \n__________________________________________________
			  \n"
		self.country = gets.strip.upcase
	end

	def apikey_input
		puts "\n
			  \n_________________________________________________________________________
			  \nEnter an API Key to access Open Weather Map data:
			  \n\t- Typing 'default' will induce the use of a free included API Key
			  \n_________________________________________________________________________
			  \n"
		self.api_holder = gets.strip.to_s.downcase
		self.api_key = self.api_holder
	end	

	def units_input
		puts "\n
			  \n__________________________________________________________________________________________
			  \nEnter the desired unit class of measurement desired for current temperature:
			  \n\t- Typing 'default' induces the selection of Imperial (Farenheit)
			  \n\t- Possible parameters = Imperial (Fahrenheit), Metric (Celsius), Standard (Kelvin)
			  \n__________________________________________________________________________________________
			  \n"
		self.units = gets.strip.to_s.downcase
	end

	def retrieve
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city},#{@country}&APPID=#{@api_key}#{@units_searcher}#{@units}"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
	end

	def search_pars
		self.apikey_input
			if self.api_holder == "default" || "8eef60721040ad22fe6d4b1c96fdfbb7"
				self.api_key = "8eef60721040ad22fe6d4b1c96fdfbb7"
			else
				self.api_key = self.api_holder
			end
		self.units_input
			if self.units == "default" || "imperial"
				self.units = "imperial"
			elsif self.units == "metric"
				self.units = "metric"
			elsif self.units == "standard"
				self.units = ""
			end
	end

	def current_temperature
		begin
			self.search_inputs
			self.retrieve
			puts "\n
				  \n__________________________________________________________________
				  \nThe current temperature in #{@city}, #{@country}: #{@temperature}.
				  \n__________________________________________________________________
				  \n"
		rescue OpenURI::HTTPError
			puts "\n
				  \n_________________________________________________
				  \n#{@city}, #{@country} is not a valid combination.
				  \n_________________________________________________
				  \n"
			self.apikey_input
			self.units_input
			self.search_inputs
		end
	end
		
	def exorcon_input
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		self.exorcon = gets.strip.to_s.downcase
	end

	def executes
		self.search_pars
		while self.exorcon == "no"
			self.current_temperature
			self.exorcon_input
				if self.exorcon == "no"
					self.current_temperature
					self.exorcon_input
				elsif self.exorcon == "yes"
					exit(true)
				end
		end
	end

end

# binding.pry#