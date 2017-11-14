require_relative "../../spec_helper.rb"

describe OWM::Response do

	let(:respbody){bodyy = '"{\"coord\":{\"lon\":-92.64,\"lat\":41.3},\"weather\":[{\"id\":701,\"main\":\"Mist\",\"description\":\"mist\",\"icon\":\"50n\"}],\"base\":\"stations\",\"main\":{\"temp\":4.25,\"pressure\":1025,\"humidity\":93,\"temp_min\":3,\"temp_max\":6},\"visibility\":11265,\"wind\":{\"speed\":3.1,\"deg\":140},\"clouds\":{\"all\":90},\"dt\":1510637700,\"sys\":{\"type\":1,\"id\":892,\"message\":0.0036,\"country\":\"US\",\"sunrise\":1510664292,\"sunset\":1510699890},\"id\":4870239,\"name\":\"Oskaloosa\",\"cod\":200}"'}
	let(:json){data = '{"coord":{"lon":-92.64,"lat":41.3},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"base":"stations","main":{"temp":4.13,"pressure":1025,"humidity":93,"temp_min":3,"temp_max":6},"visibility":8047,"wind":{"speed":3.6,"deg":140},"clouds":{"all":90},"dt":1510632900,"sys":{"type":1,"id":892,"message":0.1681,"country":"US","sunrise":1510664288,"sunset":1510699893},"id":4870239,"name":"Oskaloosa","cod":200}'}
	let(:responsee){OWM::Response.new(respbody)}

	context "Initialize" do
		describe "#new(response)" do
			context "new(respboddy)" do
				it "Inititalizes with the response provided by and OWM::Api object." do
					expect(responsee.response).to eq(respbody)
				end
			end
		end
	end

	context "Response Body" do
		describe "#response_body" do
			context "@response_body" do
				it "Allows for the @response.body (instance variable + method) to be called upon by the Response object through the  Portaled Api/Client Object. This is necessary as #body cannot be called with chain method." do
					responsee.response_body = respbody
					expect(responsee.response).to eq(respbody)
				end
			end
		end
	
		describe "#weather" do
			context "@weather" do
				it "Sets @weather (instance variable) to the JSON parsed derivative of the #response_body." do
					responsee.response_body = respbody
					weather = JSON.parse(responsee.response)
					main = json['main']
					temp = main['temp'].to_f
					expect(temp).to eq(0)
				end
			end
		end
	end

end
