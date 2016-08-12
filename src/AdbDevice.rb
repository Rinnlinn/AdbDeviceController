require './ConnectState.rb'

class AdbDevice
    include ConnectState
    def initialize(ipaddress, port)
        @IpAddress = ipaddress
        @ConnectState = ConnectState::DISCONNECTED
        @port = port
    end

    def getIpAddress
        @IpAddress
    end

    def getConnectState
        @ConnectState
    end

    def getPort
      @port
    end

    def connect
        puts "Connecting #{@IpAddress}:#{@port}"
        result = if @port.nil?
                     `adb connect #{@IpAddress}`
                 else
                     `adb connect #{@IpAddress}:#{@port}`
                 end

        result.chomp!
        @ConnectState = if result.include?('unable')
                            ConnectState::DISCONNECTED
                        else
                            ConnectState::CONNECTED
                        end
        @ConnectState
    end
end
