require_relative '../spec_helper'
require_relative '../../src/AdbDevice.rb'
require_relative '../../src/DeviceJsonReader.rb'

RSpec.describe DeviceJsonReader do
  it 'Testread_device_data' do
    djr = DeviceJsonReader.new
    actual = djr.read_device_data('./test_device.json')
    expect(actual[0].ip_address).to eq ("192.168.1.1")
    expect(actual[1].ip_address).to eq ("192.168.1.2")
    expect(actual[2].ip_address).to eq ("192.168.1.3")
    expect(actual[3].ip_address).to eq ("192.168.1.4")
    expect(actual[0].port).to eq (8080)
    expect(actual[1].port).to eq (8081)
    expect(actual[2].port).to eq (8082)
    expect(actual[3].port).to eq (8082)
  end
end
