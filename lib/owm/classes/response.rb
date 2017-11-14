module OWM
	class Response

		attr_accessor :response, :response_body, :weather

		def initialize res
			@response = res
		end

		def response_body
			@response_body = @response.body
		end

		def weather
			@weather = Weather.new JSON.parse(response_body)
		end

	end
end	




