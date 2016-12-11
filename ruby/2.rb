require 'csv'
require 'json'

result = 0
json = JSON.parse(File.read(ARGV[1]))
csv = File.open(ARGV[0])

json.each_key { |key|
	help = 0
	CSV.foreach(csv) do |row|
		if key.to_i == row[1].to_i then
			help = 1
		end
	end
	if help > 0 then
			result += json.fetch(key).to_i
		end
}
puts result
