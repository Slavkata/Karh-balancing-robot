require 'json'
require 'crack'

json = JSON.parse(File.read(ARGV[0]))
xml = Crack::XML.parse(File.read(ARGV[1]))
json = json.keys
xml = xml.fetch(xml.keys[0]).keys

i = 0
count = 0
m = 0

while i < xml.count do
    m = 0
    while m < json.count do
        if json[i] == xml[m] && xml[m].bytesize > 3
            count += 1
        end
        m += 1
    end
    i += 1
end
puts count
