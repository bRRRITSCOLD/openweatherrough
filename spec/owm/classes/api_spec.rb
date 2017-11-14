require_relative "../../spec_helper.rb"

describe OWM::Api do

	let(:client){OWM::Client.new(options = {consumer_api_key: "xxx123xxxxxxx123456xxxx123xxx"})}
	let(:params){params = {appid: "xxx123xxxxxxx123456xxxx123xxx", q: 'westphiladelphia', units: 'bornandraised' }}
	let(:params2){params2 = {appid: "aaa123aaaaaaa123456aaaa123aaa", q: 'eastphiladelphia', units: 'neverbornorraised' }}
	let(:apii){OWM::Api.new(client, params)}

	context "Intialize" do
		describe ".new(client, params)" do
			context ".new(OWM::Client.new(options = {consumer_api_key: 'xxx123xxxxxxx123456xxxx123xxx'}), params = {})" do
				it "Initializes as an OWM::Api object." do
					expect(apii.class).to eq(OWM::Api)
				end

				it "Initializes with a client and params." do
					expect(apii.client).to eq(client)
					expect(apii.parameters).to eq(params)
				end
			end
		end
	end

	context "Parameters" do
		describe "#parameters" do
			context "@parameters" do
				it "Returns the params hash used at initialization." do
					expect(apii.parameters).to eq(params)
				end

				it "Returns the parameters that will be used for get request." do
					expect(apii.parameters[:appid]).to eq("xxx123xxxxxxx123456xxxx123xxx")
					expect(apii.parameters[:q]).to eq('westphiladelphia')
					expect(apii.parameters[:units]).to eq('bornandraised')
				end
			end
		end
		
		describe "#parameters=" do
			context "@parameters=" do
				it "Allows for the parameters to be set to a new set of options/a new hash." do
					apii.parameters = params2
					expect(apii.parameters[:appid]).to eq("aaa123aaaaaaa123456aaaa123aaa")
					expect(apii.parameters[:q]).to eq('eastphiladelphia')
					expect(apii.parameters[:units]).to eq('neverbornorraised')
				end
			end
		end
	end

	context "Get Weather" do
		describe "#get_weather" do	
		# will add webmock stub later, still unsure on how to set these up, this part of the program was not build by full fledge TDD, but continued after.	
		end
	end
end



