require_relative '../spec_helper'
require_relative '../../src/DeviceManager.rb'
require_relative '../../src/AdbDevice.rb'

RSpec.describe DeviceManager do
    it 'TestAddDevice' do
        dm = DeviceManager.new
        device = AdbDevice.new('192.168.1.5', 80)
        dm.add_device(device)
        devices = dm.get_devices
        result = false
        devices.each do |actual_device|
            if actual_device.ip_address == '192.168.1.5' && actual_device.port == 80
                result = true
            end
        end
        expect(result).to eq true
    end

    it 'TestRemoveDevice_Success' do
        dm = DeviceManager.new
        device = AdbDevice.new('192.168.1.5', 80)
        dm.add_device(device)
        result = dm.remove_device(device)
        expect(result).to eq true
    end

    it 'TestRemoveDevice_failure' do
        dm = DeviceManager.new
        device = AdbDevice.new('192.168.1.5', 80)
        result = dm.remove_device(device)
        expect(result).to eq false
    end

    it 'TestRemoveDevice_nil' do
        dm = DeviceManager.new
        result = dm.remove_device(nil)
        expect(result).to eq false
    end
end
