require 'json'
require 'crack'

json = JSON.parse(File.read(ARGV[0]))
xml = Crack::XML.parse(File.read(ARGV[1]))
json = json.keys
xml = xml.keys
i = 0
count = 0
m = 0
while i < xml.count do
    if xml[i].bytesize > 3
        while m < json.count
            if json[m] != xml[m]
                count += xml[m].bytesize
            end
            m += 1
        end
    end
    i += 1
end
puts count
