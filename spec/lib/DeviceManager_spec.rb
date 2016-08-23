require_relative '../spec_helper'
require_relative '../../src/DeviceManager.rb'
require_relative '../../src/AdbDevice.rb'

RSpec.describe DeviceManager do
  it 'TestAddDevice' do
    dm = DeviceManager.new
    device = AdbDevice.new("192.168.1.5", 80)
    dm.add_device(device)
    devices = dm.getDevices
    result = false
    devices.each do |actual_device|
      if (actual_device.getIpAddress == "192.168.1.5" && actual_device.getPort == 80)
        result = true
      end
    end
    expect(result).to eq true
  end
end
