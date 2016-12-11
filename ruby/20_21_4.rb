require 'csv'

result = 1
state = 0

csv = File.open(ARGV[0])

CSV.foreach(csv) do |row|
	if row[0] == "C1" then next end
	if row[0].to_i < row[3].to_i && row[2].to_i == row[3].to_i + 3 then
		if state != 1 then state = 1 end
		result *= row[2].to_i
	end
end

if state == 1 then puts result
	else puts 0
end
