require 'open-uri'
require 'json'
# require 'pry'

class Current

	attr_accessor :city, :country, :api_key, :request, :response, :parsed, :temperature

	def inputs
		puts "Please enter a City Name:"
		self.city = gets.strip.capitalize
		puts "\nPlease enter a Country or USA State Code (Country Code Example: US, UK, FR, Etc. - and - USA State Code Example: IA, IL, MN, Etc.)."
		self.country = gets.strip.upcase
	end

	def retrieve
		@request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city},#{@country}&APPID=8eef60721040ad22fe6d4b1c96fdfbb7&units=imperial"
		@response = open(@request).readlines.join
		@parsed = JSON.parse(@response)
		@temperature = @parsed['main']['temp'].to_f
	end

#	binding.pry

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
end	

# binding.pry
