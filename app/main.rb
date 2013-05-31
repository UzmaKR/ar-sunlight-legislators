#require_relative '../db/config'
require_relative 'models/politician'

p array_of_politician_objects = Politician.where(state: "HI", title: "Sen")
puts "Senators"
array_of_politician_objects.each do |politician|
  puts "  #{politician.firstname} #{politician.lastname} (#{politician.party})"
end

array_of_politician_objects = Politician.where(state: "HI", title: "Rep")
puts "Representatives:"
array_of_politician_objects.each do |politician|
  puts "  #{politician.firstname} #{politician.lastname} (#{politician.party})"
end





array_of_politician_objects = Politician.where(gender: "F", in_office: "1",
                              title: "Sen" )
total_senators = Politician.where(title: "Sen").length.to_f
puts "Number of female senators: #{array_of_politician_objects.length}"
puts "Percentage of female senators: #{(array_of_politician_objects.length/total_senators * 100).to_i}"

female_reps = Politician.where(gender: "F", in_office: "1",
                              title: "Rep" ).length
total_reps = Politician.where(title: "Rep").length
puts "Number of female reps: #{female_reps}"
puts "Percent of female reps: #{(female_reps.to_f/total_reps * 100).to_i}"



states = []

Politician.all.each do |politician|
  states << politician.state
end
states.uniq!

counts = {}

states.each do |state|
  counts[state] = Politician.where(state: "#{state}", in_office: "1").length
end

newhash = counts.sort_by {|state, num| -num}

newhash.each {|state, count| puts "#{state}: 2 Senators, #{count-2} Representative(s)"}

puts "Senators: #{Politician.where(title: "Sen").length}"
puts "Representatives: #{Politician.where(title: "Rep").length}"
# Politician.where(in_office: "1", )

list_of_inactive_congresspeople = Politician.where(in_office: "0")
list_of_inactive_congresspeople.each { |o| o.destroy }

puts "Senators: #{Politician.where(title: "Sen").length}"
puts "Representatives: #{Politician.where(title: "Rep").length}"


