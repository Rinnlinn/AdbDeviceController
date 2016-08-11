require 'jrubyfx'
require './AdbDevice.rb'

class AdbController < JRubyFX::Application
    def start(stage)
        with(stage, title: 'ADBController', width: 400, height: 400) do
            layout_scene do
                vbox do
                    label('hello', id: 'CommandState')
                    button('Connect') do
                        set_on_action do
                            device = AdbDevice.new('192.168.11.11', 8080)
                            stage['#CommandState'].text = device.connect
                        end
                    end
                end
            end
            show
        end
    end
end

AdbController.launch
