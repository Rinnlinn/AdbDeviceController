require 'json'
class JsonReader
    def readFile(path)
        json_data = open(path) do |io|
            JSON.load io
        end
        json_data
    end
end
