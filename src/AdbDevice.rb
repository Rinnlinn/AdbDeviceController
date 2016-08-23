require_relative './ConnectState.rb'

class AdbDevice
    include ConnectState
    def initialize(ipaddress, port)
        @IpAddress = ipaddress
        @ConnectState = ConnectState::DISCONNECTED
        @port = port
    end

    def ip_address
        @IpAddress
    end

    def connect_state
        @ConnectState
    end

    def port
        @port
    end

    def make_device_data_map
        data = { 'IpAddress' => @IpAddress, 'port' => @port, 'ConnectState' => @ConnectState }
        data
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
