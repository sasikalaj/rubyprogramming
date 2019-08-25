# This script is to show if the instance variable declared
# inside the module is a
# instance variable of it or not. Here @name is a instance
# variable of
# module Plg, but cannot be accessed by Plg.name as we know
# any module does not own its instance methods or variable,
# it can be accessed
# only by the instance that extends the module

# module Plg
#   @age = 12
#
#   def self.name1
#     puts "inside plg self.name"
#     @names = "john smith" #config.send("names")
#     @postcode = "Dubai main road"
#   end
#
#   def address1
#     @address = "Dubai salai"
#   end
#
#   def config
#     puts "inside plg config "
#     @config ||= configuration
#   end
#
#   def configure
#     puts "inside plg configure"
#     @config ||= Configuration.new
#     yield(@config) if block_given?
#     @config
#   end
#
#   class Configuration
#     attr_accessor :names
#
#     def initialize
#       puts "inside plg configuration intialize"
#       @names = "John smith"
#     end
#   end
# end
#
# # puts "plg name is #{Plg.name1}"
# puts "plg name is #{Plg.names}" # it does not complain becuse it is defined
# # inside the self class, but the value is empty
# Plg.name
# puts "plg postcode is #{Plg.postcode}" # it does not complain becuse it is defined
# # inside the self class, but the value is empty
# puts "end of plg name"
# puts "plg address is #{Plg.address}" # fails as it is declared outside self
# # so it is a instance variable of the object that extends it
#
# puts "plg age is #{Plg.age}" # fails as it is declared outside self
# # so it is a instance variable of the object that extends it
#
