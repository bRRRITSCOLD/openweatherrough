require 'open-uri'
require 'json'
#require 'pry'

class Current

	attr_accessor :city, :country, :api_key, :request, :response, :parsed, :temperature, :exorcon, :units, :ex, :con, :units_searcher

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
		self.city = gets.strip.to_s.capitalize
		puts "\n
			  \n__________________________________________________
			  \nEnter a Country or USA State Code:
			  \n\t- Country Code Example: US, UK, FR, Etc.
			  \n\t- USA State Code Example: IA, IL, MN, Etc.
			  \n__________________________________________________
			  \n"
		self.country = gets.strip.to_s.upcase
	end	

	def units_input
		puts "\n
			  \n________________________________________________________________________________________________________________________
			  \nEnter the desired unit class of measurement desired for current temperature:
			  \n\t- Typing 'standard', 'default' or 'any word != imperial or metric' induces the selection of Imperial (Farenheit)
			  \n\t- Possible parameters = Imperial (Fahrenheit), Metric (Celsius), Standard (Kelvin)
			  \n________________________________________________________________________________________________________________________
			  \n"
		self.units = gets.strip.to_str.downcase
	end

	def retrieve
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city},#{@country}&APPID=#{@api_key}#{@units_searcher}#{@units}"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
	end

	def exorcon_input
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		self.exorcon = gets.strip.downcase
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
			self.search_inputs
		end
	end
		
	def exorcon_input
		puts "\n
			  \n______________________________________________________
			  \nWoud you like to exit the ENTIRE program? (Yes or no)
			  \n______________________________________________________
			  \n"
		self.exorcon = gets.strip.downcase
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



