require 'json'
require_relative './JsonWriter.rb'
require_relative './AdbDevice.rb'

class DeviceJsonWriter
    def write_file(path, json_data)
        open(path, 'w') do |io|
            JSON.dump(json_data, io)
        end
    end

    def write_device_data(devices)
        device_data = []
        devices.each do |device|
            device_data.push(device.make_device_data_map)
        end

        json_data = { 'devices' => device_data }
        write_file('./devices.json', json_data)
    end
end
