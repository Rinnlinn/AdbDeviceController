require_relative './AdbDevice.rb'
require_relative './DeviceJsonReader.rb'

class DeviceManager
    def initialize
        djr = DeviceJsonReader.new
        @@devices = djr.read_device_data('./devices.json')
    end

    def get_devices
        @@devices
    end

    def add_devices(devices_to_add)
        devices_to_add.each do |device|
            @@devices.push(device)
        end
        @@devices
    end

    def add_device(device)
        @@devices.push(device)
    end

    def remove_device(device)
        result = @@devices.delete(device)
        if result.nil?
            return false
        else
            return true
        end
    end
end
