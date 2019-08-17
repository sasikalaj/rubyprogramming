#!/usr/local/bin/ruby
puts 'output of put statment'
puts "Hello Matz" 
#you can also add /usr/bin/env ruby as the first line 
puts 'o/p of system echo with single qutoes inside double quotes'
system "echo 'Hello matz'"
puts 'o/p of system echo with just double quotes'
system "echo Hello match"
puts 'o/p of system echo with each statment as seperate argument'
system "echo", "Hello", ",matz"
puts 'o/p of string append with +' 
puts "Hello," + "Matz!"
puts 'o/p of string with <<'
puts "Hi" << "mats"
puts 'o/p of multiply by *'
puts 'Hello Matz' * 3
puts 'o/p of multiply by times'
5.times { print "Hello Matz" } 	
a=5 
if a == 4 
  begin 
    return 
  ensure a = 30; puts a 
  end
else 
  a = 6
  puts a 
end 
puts a 

