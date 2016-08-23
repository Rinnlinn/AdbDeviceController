require_relative '../spec_helper'
require_relative '../../src/AdbDevice.rb'

RSpec.describe AdbDevice do
    device = AdbDevice.new('1.1.1.1', 8080)
    it 'Testmake_device_data_map' do
        expect_data = { 'IpAddress' => '1.1.1.1', 'port' => 8080, 'ConnectState' => 'disconnected' }
        expect(device.make_device_data_map).to eq expect_data
    end
    it 'Testip_address' do
        expect(device.ip_address).to eq '1.1.1.1'
    end
    it 'TestPort' do
        expect(device.port).to eq 8080
    end
end
