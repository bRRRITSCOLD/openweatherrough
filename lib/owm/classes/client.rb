module OWM
	class Client

		attr_accessor :consumer_api_key
		attr_reader :api
		alias_method :key, :consumer_api_key

	    def initialize(options = {})   
			options[:consumer_api_key] ||= options[:key]
			raise ArgumentError.new ":api_key or :key is required" unless options[:consumer_api_key].is_a?(String)
	      	@consumer_api_key = options[:consumer_api_key]
	    	yield(self) if block_given?
	    	conn
	    	@api = Portal.new self, Api
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

# binding.pry