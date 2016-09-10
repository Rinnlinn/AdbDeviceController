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
        show_all_devices
    end

    def show_all_devices
        dm = DeviceManager.new
        devices = dm.get_devices
        devices.each do |device|
            @table.items << TableRecord.new(device)
        end
    end

    def connect_device_button
        selected_device = @table.get_selection_model.get_selected_item.adb_device
        selected_device.connect
    end

    def add_device_button
        device = AdbDevice.new(@input_ip_address.get_text, @input_port.get_text)
        dm = DeviceManager.new
        dm.add_device(device)
        @table.items << TableRecord.new(device.ip_address, device.port, device.connect_state)
    end

    # テーブル1レコードぶんのデータクラス
    class TableRecord
        attr_reader :adb_device
        attr_reader :ip_address
        attr_reader :port
        attr_reader :connect_state
        def initialize(device)
            @adb_device = device
            @ip_address = J::SimpleStringProperty.new(device.ip_address)
            @port = J::SimpleStringProperty.new(device.port.to_s)
            @connect_state = J::SimpleStringProperty.new(device.connect_state)
        end
    end
end
