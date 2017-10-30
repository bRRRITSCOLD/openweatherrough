require 'open-uri'
require 'json'
require 'yaml'
require_relative '../modules/cli_interface_module.rb'
require_relative '../modules/api_key_module.rb'
require_relative '../modules/validations_module.rb'
# require 'pry'

class Current

	include CLI
	include API_KEY
	include Valids

	attr_accessor :city_input, :country_state_input, :api_key, :city_name, :country_abrv, :request, :response, :parsed, :temperature, :ex_yes_no_input, :units_input, :ex_yes, :ex_no, :units_searcher

	def initialize
		@ex_yes = "yes"
		@ex_no = "no"
		@ex_yes_no_input = @ex_no
		@units_searcher = "&units="
	end

	def current_temperature_retrieval
		self.set_api_key
		self.request = "http://api.openweathermap.org/data/2.5/weather?q=#{@city_input},#{@country_state_input}&APPID=#{@api_key}#{@units_searcher}#{@units_input}"
		self.response = open(@request).readlines.join
		self.parsed = JSON.parse(@response)
		self.temperature = @parsed['main']['temp'].to_f
		self.city_name = @parsed['name'].to_s.split(" ").map!(&:capitalize).join(" ")
		self.country_abrv = @parsed['sys']['country'].to_s.upcase
	end

	def current_temperature_search_inputs_retrieval
		begin
			self.units_inputs
			self.city_country_state_inputs
			self.current_temperature_retrieval
				if city_valid? !=true 
					self.city_country_state_inputs_invalid_message
					self.city_country_state_inputs && self.current_temperature_retrieval && self.city_country_state_inputs_invalid_message until city_valid?				
					self.current_temperature_message
				else
					self.current_temperature_message
				end
		rescue OpenURI::HTTPError
			self.city_country_state_inputs_invalid_message
			self.city_country_state_inputs
		end
	end
		

	def execute_run_current_temperature
		self.welcome_message
		while @ex_yes_no_input == @ex_no
			self.current_temperature_search_inputs_retrieval
			self.ex_yes_no_inputs
				if @ex_yes_no_input == @ex_no
					self.current_temperature_search_inputs_retrieval
					self.ex_yes_no_inputs
				elsif @ex_yes_no_input == @ex_yes
					exit(true)
				elsif @ex_yes_no_input != @ex_yes && @ex_yes_no_input != @ex_no
					self.ex_yes_no_invalid_message
					self.ex_yes_no_inputs && self.ex_yes_no_invalid_message until ex_yes_no_valid?
				end
		end
	end

end

# binding.pry


