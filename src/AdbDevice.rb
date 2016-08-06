require './ConnectState.rb'

class AdbDevice
  include ConnectState
  def initialize(ipaddress, port)
    @IpAddress = ipaddress
    @ConnectState = ConnectState::DISCONNECTED
    @port = port
  end

  def getIpAddress
    return @IpAddress
  end

  def getConnectState
    return @ConnectState
  end

  def connect
    puts "Connecting #{@IpAddress}:#{@port}"
    if @port.nil?
      result = `adb connect #{@IpAddress}`
    else
      result = `adb connect #{@IpAddress}:#{@port}`
    end

    result.chomp!
    if result.include?("unable")
      @ConnectState = ConnectState::DISCONNECTED
    else
      @ConnectState = ConnectState::CONNECTED
    end
    return @ConnectState
  end
end
