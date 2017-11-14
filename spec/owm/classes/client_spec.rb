require_relative "../../spec_helper.rb"

describe OWM::Client do

	let(:params){Hash.new()}
	let(:client_initialize_new){OWM::Client.new}
	let(:client_initialize_options){OWM::Client.new(options = {consumer_api_key: "xxx123xxxxxxx123456xxxx123xxx"})}
	let(:client_initialize_options_empty){OWM::Client.new(options = {})}
	let(:client_api_intialize_new){client_initialize_options.api.new(params)}

	context "Initialize " do
		describe "#new()" do
			it "Disallows initialization of an OWM::Client object when no arguments are provided." do
				expect{client_initialize_new}.to raise_error(ArgumentError)
			end

			it "Raises ArguementError.new(':api_key or :key is required') ':api_key or :key is required' when an OWM::Client object is intialized with no arguments provided." do
				expect{client_initialize_new}.to raise_error(":api_key or :key is required")
			end
		end

		describe "#new(options = {})" do
			context "options = {}" do 
				it "Disallows initialization of an OWM:Client object when an empty options hash (options = {}) is provided." do
					expect{client_initialize_options_empty}.to raise_error(ArgumentError)
				end

				it "Raises ArguementError.new(':api_key or :key is required') ':api_key or :key is required' when OWM::Client object is initialized with an empty options hash (options = {}) provided." do
					expect{client_initialize_options_empty}.to raise_error(":api_key or :key is required")
				end
			end
		end

		describe "#new(options = {key: 'value})" do
			context "options = {consumer_api_key: 'xxx123xxxxxxx123456xxxx123xxx'}" do
				it "Allows initialization of an OWM:Client object with a filled options hash (options = {key: 'value'}) provided." do
					expect(client_initialize_options).to be_an_instance_of(OWM::Client)
					expect(client_initialize_options.class).to eq(OWM::Client)
				end	

				it "Intializes an OWM::Client object by setting the @instance_variables correctly to the defined 'values' in the filled options hash (options = {key: 'value'})." do
					expect(client_initialize_options.consumer_api_key).to eq("xxx123xxxxxxx123456xxxx123xxx")
				end		 

				it "Does not raise ArguementError.new(':api_key or :key is required') ':api_key or :key is required' when an OWM::Client object is intialized with a filled options hash (options = {key: 'value'}). With :cosumer_api_key or :key being a String." do		
					expect(client_initialize_options.consumer_api_key).to be_an_instance_of(String)
				end
			end
		end

		describe "#new#yield(self)block" do
			context ".new(options={key: 'value'}) do |config| config.method = option[:key] end" do
		 		it "Yields itself/Is constructable with a block, config block." do
		    		client = OWM::Client.new(options={consumer_api_key: "xxx123xxxxxxx123456xxxx123xxx"}) do |config|
		    					config.consumer_api_key = options[:consumer_api_key]
		      				end
		      		expect(client.class).to be(OWM::Client)
		    	end
		  	end
		end

		describe "#alias_method" do
			context "@key, @consumer_api_key (:key, :consumer_api_key)" do
				it "Allows @consumer_api_key (instance variable, :consumer_api_key) to be refered to and aliased as @key (instance variable, :key)." do
					expect(client_initialize_options.method(:consumer_api_key) == client_initialize_options.method(:key)).to eq(true)
				end
			end
		end	
	end

	context "API" do
		describe "#api" do
			context "@api" do
				it "Allows @api 'constructor' to be set/initialized during an OWM::Client object's initialization." do
					expect(client_initialize_options.api).to be_an_instance_of(OWM::Portal)
					expect(client_initialize_options.api.class).to eq(OWM::Portal)
				end
			end

			context "@api.@parent" do
				it "The inheritance for parent (@parent, instance variable) is of OWM::Client." do
					expect(client_initialize_options.api.instance_variable_get(:@parent)).to eq(client_initialize_options)
				end
			end

			context "@api.@klass" do
				it "The inheritance for class (@klass, instance variable) is of OWM::Api." do
					expect(client_initialize_options.api.instance_variable_get(:@klass)).to eq(OWM::Api)
				end
			end
		end
	end

	context "Consumer API Key" do
		describe "#consumer_api_key=" do
			context "@consumer_api_key=" do
				it "Allows the @consumer_api_key (instance variable) of the specified OWM::Client object to be set after intialization has already occured." do
					client_initialize_options.consumer_api_key = "@consumer_api_key (instance variable) was set. (#setter)"
					consumer_api_key_reference = client_initialize_options.instance_variable_get(:@consumer_api_key)
					expect(consumer_api_key_reference).to eq("@consumer_api_key (instance variable) was set. (#setter)")
				end
			end
		end

		describe "#consumer_api_key" do
			context "@consumer_api_key" do
				it "Returns the @consumer_api_key (instance variable) of the specified OWM:Client object." do
					expect(client_initialize_options.consumer_api_key).to eq("xxx123xxxxxxx123456xxxx123xxx")			
				end
			end
		end
	end
end