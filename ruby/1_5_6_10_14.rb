require 'crack'
require 'json'

result = 0

json = JSON.parse(File.read(ARGV[0]))
xml = Crack::XML.parse(File.read(ARGV[1]))
xml = xml.fetch(xml.keys[0]).keys

xml.each { |node|
	json.each_key { |key|
		if node == key then
			result += 1
		end
	}
}

puts result
