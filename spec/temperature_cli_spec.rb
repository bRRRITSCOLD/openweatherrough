require_relative './spec_helper.rb'
require_relative '../lib/classes/current_temperature.rb'
require_relative '../lib/modules/cli_interface_module.rb'


describe "bin/openweathermapcli" do
  it 'instantiates an instance of Current' do
    temp = Current.new
    allow($stdout).to receive(:puts)
    allow(temp).to receive(:execute_run_current_temperature)
    allow(temp).to receive(:gets).and_return("Chicago")
    allow(temp).to receive(:gets).and_return("IL")


    expect(Current).to receive(:new).and_return(temp)

    run_file("./bin/openweathermapcli")
  end

  it 'calls #execute_run_current_temperature on the instance of Current' do
    temp = Current.new
    allow($stdout).to receive(:puts)

    expect(Current).to receive(:new).and_return(temp)
    expect(temp).to receive(:execute_run_current_temperature)
    run_file("./bin/openweathermapcli")
  end
end