require_relative './spec_helper.rb'
require_relative '../lib/current.rb'

describe Current do

	describe '#new' do
		it "creates Current object" do
			temp = Current.new
			expect(temp.class).to eq(Current)
		end
	end

	describe '#inputs' do
	 	before do
	 		io_obj = double
	 	expect(subject)
	 		.to receive(:gets)
	 		.and_return(io_obj)
        	.twice
		expect(io_obj)
		    .to receive(:strip)
		    .and_return(:city.capitalize)
		expect(io_obj)
        	.to receive(:strip)
        	.and_return(:country.upcase)
    	end

   		it 'sets @city and @country accordingly to user inputs, also capitalizes/upcases inputs' do
   			subject.inputs

    		expect(subject.instance_variable_get(:@city)).to eq(:city.capitalize)
      		expect(subject.instance_variable_get(:@country)).to eq(:country.upcase)
    	end
  	end

  	describe '#retrieve' do
	  	it 'successfully retrieves temperature from api data request' do
	  			temp = Current.new
	  			temp.city = 'Chicago'
	  			temp.country = 'IL'
	  			temp_response = temp.retrieve

	  			expect(temp_response).to be_an_instance_of(Float)
	  	end
	end

end

	