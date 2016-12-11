
require 'csv'
require 'json'
result = 0
state = 0
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
			if state != 1 state = 1 end
			result *= json.fetch(key).to_i
		end
end
}

if state == 1 puts result
else puts 0
end
