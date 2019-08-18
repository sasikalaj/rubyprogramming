# This script is to show if the instance variable declared
# inside the module is a
# instance variable of it or not. Here @name is a instance
# variable of
# module Zpl, but cannot be accessed by Zpl.name as we know
# any module does not own its instance methods or variable,
# it can be accessed
# only by the instance that extends the module

module Zpl
  @age = 12

  def self.name1
    puts "inside zpg self.name"
    @names = "john smith" #config.send("names")
    @postcode = "Dubai main road"
  end

  def address1
    @address = "Dubai salai"
  end

  def config
    puts "inside zpg config "
    @config ||= configuration
  end

  def configure
    puts "inside zpg configure"
    @config ||= Configuration.new
    yield(@config) if block_given?
    @config
  end

  class Configuration
    attr_accessor :names

    def initialize
      puts "inside zpg configuration intialize"
      @names = "John smith"
    end
  end
end


puts "zpl name is #{Zpl.names}" # it does not complain becuse it is defined
# inside the self class, but the value is empty
Zpl.name
puts "zpl postcode is #{Zpl.postcode}" # it does not complain becuse it is defined
# inside the self class, but the value is empty
puts "end of zpl name"
puts "zpl address is #{Zpl.address}" # fails as it is declared outside self
# so it is a instance variable of the object that extends it

puts "zpl age is #{Zpl.age}" # fails as it is declared outside self
# so it is a instance variable of the object that extends it

