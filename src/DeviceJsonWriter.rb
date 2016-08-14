require './JsonWriter.rb'
require './AdbDevice.rb'

class DeviceJsonWriter < JsonWriter
    def writeDeviceData(devices)
        device_data = []
        devices.each do |device|
            device_data.push(device.makeDeviceDataMap)
        end

        json_data = { 'devices' => device_data }
        writeFile('../devices.json', json_data)
    end
end
