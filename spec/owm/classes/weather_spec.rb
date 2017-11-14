require_relative "../../spec_helper.rb"

describe OWM::Weather do

	let(:json){data = '{"coord":{"lon":-92.64,"lat":41.3},"weather":[{"id":701,"main":"Mist","description":"mist","icon":"50n"}],"base":"stations","main":{"temp":4.13,"pressure":1025,"humidity":93,"temp_min":3,"temp_max":6},"visibility":8047,"wind":{"speed":3.6,"deg":140},"clouds":{"all":90},"dt":1510632900,"sys":{"type":1,"id":892,"message":0.1681,"country":"US","sunrise":1510664288,"sunset":1510699893},"id":4870239,"name":"Oskaloosa","cod":200}'}
	let(:weather){OWM::Weather.new(JSON.parse(json))}

	context "Intialize" do
		describe "#new(json)" do
			context ".new(JSON.parse{'key':value}" do
				it "Initializes as an OWM::Weather object." do
					expect(weather.class).to eq(OWM::Weather)
				end
			end
		end
	end

	context "Weather" do
		describe "#longitude" do
			context "@longitude" do
				it "Returns the longitude for the given location." do
					expect(weather.longitude).to eq(-92.64)
				end
			end
		end

		describe "#lattitude" do
			context "@lattitude" do
				it "Returns the lattitude for the given location." do
					expect(weather.lattitude).to eq(41.3)
				end
			end
		end		

		describe "#conditions" do
			context "@conditions" do
				it "Returns the conditions for the given location." do
					expect(weather.conditions).to eq('mist')
				end
			end
		end

		describe "#temperature" do
			context "@temperature" do
				it "Returns the temperature for the given location." do
					expect(weather.temperature).to eq(4.13)
				end
			end
		end

		describe "#atmospheric_pressure" do
			context "@atmospheric_pressure" do
				it "Returns the atmospheric_pressure for the given location." do
					expect(weather.atmospheric_pressure).to eq(1025)
				end
			end
		end

		describe "#humidity" do
			context "@humidity" do
				it "Returns the humidity for the given location." do
					expect(weather.humidity).to eq(93)
				end
			end
		end

		describe "#minimum_temperature" do
			context "@minimum_temperature" do
				it "Returns the minimum_temperature for the given location." do
					expect(weather.minimum_temperature).to eq(3)
				end
			end
		end

		describe "#maximum_temperature" do
			context "@maximum_temperature" do
				it "Returns the maximum_temperature for the given location." do
					expect(weather.maximum_temperature).to eq(6)
				end
			end
		end

		describe "#visibility" do
			context "@visibility" do
				it "Returns the visibility for the given location." do
					expect(weather.visibility).to eq(8047)
				end
			end
		end

		describe "#wind_speed" do
			context "@wind_speed" do
				it "Returns the wind_speed for the given location." do
					expect(weather.wind_speed).to eq(3.6)
				end
			end
		end

		describe "#wind_degree" do
			context "@wind_degree" do
				it "Returns the wind_degree for the given location." do
					expect(weather.wind_degree).to eq(140)
				end
			end
		end

		describe "#cloud_coverage" do
			context "@cloud_coverage" do
				it "Returns the cloud_coverage for the given location." do
					expect(weather.cloud_coverage).to eq(90)
				end
			end
		end

		describe "#city_name" do
			context "@city_name" do
				it "Returns the city_name for the given location." do
					expect(weather.city_name).to eq("Oskaloosa")
				end
			end
		end

		describe "#country_code" do
			context "@country_code" do
				it "Returns the country_code for the given location." do
					expect(weather.country_code).to eq("US")
				end
			end
		end

		describe "#code" do
			context "@code" do
				it "Returns the code for the given api response." do
					expect(weather.code).to eq(200)
				end
			end
		end

		describe "#sunrise" do
			context "@sunrise" do
				it "Returns the sunrise for the given location." do
					expect(weather.sunrise).to eq(1510664288)
				end
			end
		end

		describe "#sunset" do
			context "@sunset" do
				it "Returns the sunset for the given location." do
					expect(weather.sunset).to eq(1510699893)
				end
			end
		end

	end

end