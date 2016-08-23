require 'json'
require_relative './AdbDevice.rb'
class DeviceJsonReader
    def readFile(path)
        json_data = open(path) do |io|
            JSON.load io
        end
        json_data
    end

    def readDeviceData(path)
        json_data = readFile(path)
        devices_data = json_data['devices']
        devices = []
        devices_data.each do |device_data|
            device = AdbDevice.new(device_data['IpAddress'], device_data['port'])
            devices.push(device)
        end
        devices
    end
end
