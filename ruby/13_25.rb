require 'csv'

result = 0
state = 0

csv = File.open(ARGV[0])

CSV.foreach(csv) do |row|
	if row[0] == "C1" then next end
	if row[0].to_i > 17 && row[1] == "tues"  then
		result += row[2].to_i
	end
end

puts result
