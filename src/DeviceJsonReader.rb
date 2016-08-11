require './JsonReader.rb'
require './AdbDevice.rb'
class DeviceJsonReader < JsonReader
    def readDeviceData
        json_data = readFile('../devices.json')
        devices_data = json_data['devices']
        devices = []
        devices_data.each do |device_data|
            device = AdbDevice.new(device_data['IpAddress'], device_data['port'])
            devices.push(device)
        end
        devices
    end
end
