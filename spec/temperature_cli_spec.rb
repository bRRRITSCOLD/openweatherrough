require_relative './spec_helper.rb'
require_relative '../lib/current.rb'


describe "bin/openweathermapcli" do
  it 'instantiates an instance of Current' do
    temp = Current.new
    allow($stdout).to receive(:puts)
    allow(temp).to receive(:executes)
    allow(temp).to receive(:gets).and_return("Chicago")
    allow(temp).to receive(:gets).and_return("IL")


    expect(Current).to receive(:new).and_return(temp)

    run_file("./bin/openweathermapcli")
  end

  it 'calls #executes on the instance of Current' do
    temp = Current.new
    allow($stdout).to receive(:puts)

    expect(Current).to receive(:new).and_return(temp)
    expect(temp).to receive(:executes)
    run_file("./bin/openweathermapcli")
  end
end