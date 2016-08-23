require_relative '../spec_helper'
require_relative '../../src/AdbDevice.rb'
require_relative '../../src/DeviceJsonReader.rb'

RSpec.describe DeviceJsonReader do
  it 'TestReadDeviceData' do
    djr = DeviceJsonReader.new
    actual = djr.readDeviceData('./test_device.json')
    expect(actual[0].getIpAddress).to eq ("192.168.1.1")
    expect(actual[1].getIpAddress).to eq ("192.168.1.2")
    expect(actual[2].getIpAddress).to eq ("192.168.1.3")
    expect(actual[3].getIpAddress).to eq ("192.168.1.4")
    expect(actual[0].getPort).to eq (8080)
    expect(actual[1].getPort).to eq (8081)
    expect(actual[2].getPort).to eq (8082)
    expect(actual[3].getPort).to eq (8082)
  end
end
