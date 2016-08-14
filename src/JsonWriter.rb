require 'json'
class JsonWriter
    def writeFile(path, json_data)
        open(path, 'w') do |io|
            JSON.dump(json_data, io)
        end
    end
end
