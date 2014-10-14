#Read in data
f = File.new("land.csv","r")
data = f.readlines
f.close
 
#Find the mean
sum = 0
data.each do |land|
	land = land.split(",")[1].to_f
	sum = land + sum.to_f
end

mean = sum/data.size

puts 'The average land agricultural area is' + mean.to_s

#Find the standard deviation
a = []
data.each do |land|
	land = land.split(",")[1].to_f
	land = (land - mean)**2 
	a.push land
end

sum2 = 0
a.each do |land|
	sum2 = sum2 + land
end

#square root of sum2/number of data points
standard_deviation = (sum2/data.size)**0.5

#Find the z score of each number (sample value-mean/standard deviation)
d = []
data.each do |land|
	land = land.split(",")[1].to_f
	zscore = (land.to_f-mean)/standard_deviation
	d.push zscore.round(3)
end

#Put zscores in file
f = File.new("zscores.csv", "w")
f.puts d.join("\n")
f.close

# Output mean and standard deviation
puts "The standard deviation of this data is" + standard_deviation.to_s
puts "The zscores of this data are" + d.to_s

puts "The world's agricultural land per year data is located in a file called land.csv"
 
