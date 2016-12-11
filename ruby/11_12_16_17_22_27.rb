
require 'csv'
require 'json'
result = 1
json = JSON.parse(File.read(ARGV[1]))
csv = (ARGV[0])
json.each_key{ |key|
	i = 0
	help = 0
	CSV.foreach(csv) do |row|
		if key != row[2] then
			help += 1
		end
		if help == json.keys.count then
			result *= json.fetch(key).to_i
		end
end
}

puts result
