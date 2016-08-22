require_relative '../spec_helper'
require_relative '../../src/AdbDevice.rb'

RSpec.describe AdbDevice do
  it 'TestMakeDeviceDataMap' do
    device = AdbDevice.new("1.1.1.1", 8080)
    expect_data = { 'IpAddress' => "1.1.1.1", 'port' => 8080, 'ConnectState' => "disconnected" }
    expect(device.makeDeviceDataMap).to eq expect_data
  end
end
