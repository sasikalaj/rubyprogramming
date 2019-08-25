module Plg
  module OSHelper
    # Return operational system
    # @return [Symbol]
    def os
      @os ||= begin
        host_os = RbConfig::CONFIG['host_os']
        log_message(host_os)
        case host_os
        when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
          :windows
        when /darwin|mac os/
          :macosx
        when /linux/
          :linux
        when /solaris|bsd/
          :unix
        else
          raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
        end
      end
    end
  end
end

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

