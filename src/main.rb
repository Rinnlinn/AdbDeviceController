require 'jrubyfx'
require_relative './AdbDevice.rb'
require_relative './DeviceManager.rb'
require_relative './DeviceListTable.rb'

fxml_root Dir.pwd + '/ui'
class AdbController < JRubyFX::Application
    def start(stage)
        stage.fxml DeviceListWindow
        stage.show
    end
end

AdbController.launch
