require 'jrubyfx'
require './AdbDevice.rb'
require './DeviceManager.rb'
require './DeviceListTable.rb'

fxml_root '../ui'

class AdbController < JRubyFX::Application
    def start(stage)
      stage.fxml DeviceListWindow
      stage.show
    end
end

AdbController.launch
