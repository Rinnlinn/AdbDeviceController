require './AdbDevice.rb'
require './DeviceJsonReader.rb'

class DeviceManager
    def initialize
        djr = DeviceJsonReader.new
        @@devices = djr.readDeviceData
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
end
