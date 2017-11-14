require_relative "../../spec_helper.rb"

describe OWM::Portal do

	let(:client){OWM::Client.new(options = {consumer_api_key: "xxx123xxxxxxx123456xxxx123xxx"})}
	let(:portal){OWM::Portal.new(client, OWM::Api)}

	context "Intialize" do
		describe ".new(parent, klass)" do
			context ".new(OWM::Client.new(options = {consumer_api_key: 'xxx123xxxxxxx123456xxxx123xxx'}), OWM::Api)" do
				it "Initializes as an OWM::Portal object." do
					expect(portal.class).to eq(OWM::Portal)
				end

				it "Initializes with a parent (@parent, instance variable) inheritance of an OWM::Client object." do
					expect(portal.instance_variable_get(:@parent).nil?).to eq(false)
				end
				
				it "Initializes with a klass (@klass, instance variable) inheritance of an OWM::Client object." do
					expect(portal.instance_variable_get(:@klass).nil?).to eq(false)
				end
			end
		end
	end

	context "Portal" do
		describe "OWM::Portal" do
			it "Allows for parent class methods by calling with parent as first argument." do
				klass = Class.new do
	      			def initialize parent, *args, &block
	      			end
	    		end
	    		parent = 'parent'
	    		portal = OWM::Portal.new parent, klass
	    		args = [1,2,3]
	    		block = Proc.new {}
	    		expect(klass).to receive(:new).with(parent, *args, &block)
	   			portal.new(*args)
	  		end
	  	end
	end
	
end

