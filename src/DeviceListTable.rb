require_relative './AdbDevice.rb'
require_relative './DeviceManager.rb'

class DeviceListWindow
    include JRubyFX::Controller
    fxml 'device_list.fxml'
    module J
        include_package 'javafx.beans.property'
    end

    # コンストラクタ
    def initialize
        # JavaのObservableListを設定
        @table.items = FXCollections.observable_list([])
        @col_ip_address.cell_value_factory = ->(v) { v.value.ip_address }
        @col_port.cell_value_factory = ->(v) { v.value.port }
        @col_connect_state.cell_value_factory = ->(v) { v.value.connect_state }

        dm = DeviceManager.new
        devices = dm.get_devices
        devices.each do |device|
            ip_address = device.ip_address
            port = device.port
            connect_state = device.connect_state
            @table.items << TableRecord.new(ip_address, port, connect_state)
        end
    end

    # テーブル1レコードぶんのデータクラス
    class TableRecord
        attr_reader :ip_address
        attr_reader :port
        attr_reader :connect_state

        def initialize(ip_address, port, connect_state)
            @ip_address = J::SimpleStringProperty.new(ip_address)
            @port = J::SimpleStringProperty.new(port.to_s)
            @connect_state = J::SimpleStringProperty.new(connect_state)
        end
    end
end
