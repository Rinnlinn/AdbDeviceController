require './AdbDevice.rb'
require './DeviceJsonReader.rb'

class DeviceManager
  def initialize()
    djr = DeviceJsonReader.new
    @devices = djr.readDeviceData
  end

  def getDevices
    @devices
  end
end
