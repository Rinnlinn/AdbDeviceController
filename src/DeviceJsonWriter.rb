require 'json'
require_relative './JsonWriter.rb'
require_relative './AdbDevice.rb'

class DeviceJsonWriter
    def writeFile(path, json_data)
        open(path, 'w') do |io|
            JSON.dump(json_data, io)
        end
    end

    def writeDeviceData(devices)
        device_data = []
        devices.each do |device|
            device_data.push(device.makeDeviceDataMap)
        end

        json_data = { 'devices' => device_data }
        writeFile('./devices.json', json_data)
    end
end
