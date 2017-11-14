module OWM

	class Api

		attr_accessor :client, :response, :parameters

		def initialize(client, params={})
			@client = client
			conn 
			@parameters = params
		end

		def get_weather
			 @response = Response.new conn.get '/data/2.5/weather', @parameters
		end

		def conn
			@conn ||= Faraday.new(:url => 'http://api.openweathermap.org') do |f|
			  f.request  :url_encoded             # form-encode POST params
			  f.response :logger                  # log requests to STDOUT
			  f.adapter  Faraday.default_adapter  # make requests with Net::HTTP
			end
		end
	end
end	




