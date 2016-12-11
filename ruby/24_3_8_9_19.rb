require 'json'
require 'crack'

json = JSON.parse(File.read(ARGV[0]))
xml = Crack::XML.parse(File.read(ARGV[1]))
json = json.keys
xml = xml.fetch(xml.keys[0]).keys

i = 0
co = 0

while i < xml.count do
    m = 0
    help = 0
    if(xml[i].bytesize > 3) then
		while m < json.count do
		    if xml[i] != json[m]
		        help += 1
		    end
		    m += 1
		end
		if help == json.count then
			co += xml[i].bytesize
		end
    end
    i += 1
end

puts co
