require_relative './spec_helper.rb'
require_relative '../lib/current.rb'


describe "bin/temperature" do
  it 'instantiates an instance of Current' do
    temp = Current.new
    allow($stdout).to receive(:puts)
    allow(temp).to receive(:current_temperature)
    allow(temp).to receive(:gets).and_return("Chicago")
    allow(temp).to receive(:gets).and_return("IL")


    expect(Current).to receive(:new).and_return(temp)

    run_file("./bin/temperature")
  end

  it 'calls #current_temperature on the instance of TicTacToe' do
    temp = Current.new
    allow($stdout).to receive(:puts)

    expect(Current).to receive(:new).and_return(temp)
    expect(temp).to receive(:current_temperature)
    run_file("./bin/temperature")
  end
end