require 'open-uri'
require 'json'
# require 'pry'

class Current

	attr_accessor :city, :country, :api_key, :request, :response, :parsed, :temperature, :exorcon

	def initialize
		self.api_key = "8eef60721040ad22fe6d4b1c96fdfbb7"
		self.exorcon = "no"
	end

	def inputs
		puts "\nPlease enter a City Name:"
		self.city = gets.strip.capitalize
		puts "\nPlease enter a Country or USA State Code (Country Code Example: US, UK, FR, Etc. - and - USA State Code Example: IA, IL, MN, Etc.)."
		self.country = gets.strip.upcase
	end

	def retrieve
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city},#{@country}&APPID=8eef60721040ad22fe6d4b1c96fdfbb7&units=imperial"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
	end

	def current_temperature
		begin
			self.inputs
			self.retrieve
			puts "\nThe current temperature in #{@city}, #{@country} is #{@temperature}."
		rescue OpenURI::HTTPError
			puts "\n#{@city}, #{@country} is not a valid combination."
			self.inputs
		end
	end
		
	def exorcon_input
		puts "\nWoud you like to exit the ENTIRE program? (Yes or no)"
		self.exorcon = gets.strip.to_s.downcase
	end

	def executes
		while self.exorcon == no
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

# binding.pry