require_relative './AdbDevice.rb'
require_relative './DeviceJsonReader.rb'

class DeviceManager
    def initialize
        djr = DeviceJsonReader.new
        @@devices = djr.readDeviceData('./devices.json')
    end

    def getDevices
        @@devices
    end

    def addDevices(devices_to_add)
        devices_to_add.each do |device|
            @@devices.push(device)
        end
        @@devices
    end

    def add_device(device)
        @@devices.push(device)
    end
end
