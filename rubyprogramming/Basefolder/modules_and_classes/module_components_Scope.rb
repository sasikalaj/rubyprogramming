# Components inside modules by default or neither module methods
# or instance
# methods. That is
# you cannot access componentent of a module just by using the
# modulename identifier
# Contant1 here is a `global factor so we are able to access them `

module A

  attr_reader :attribute1

  Constant1 = "Constant1 in A"
  constant2 = "constant2 in A"
  @attribute1 = "Value for attribute1"

  def method_A
    puts "Inside Method_A in module A"
  end

end
puts "Module A "
puts A::Constant1 # passed
# puts A.Constant1 # Cannot access CONSTANT1 like a method with the namespace
# puts A.attribute1 # Cannot access attibute1 like a method with the namespace
# puts A::attribute1 # Cannot access attibute1 like a constant with the namespace
# puts A.constant2 # Cannot access constant2 like a method with the namespace
# puts A::constant2 # Cannot access constant2 like a constant with the namespace
# puts A.method_A # Cannot access method_A like a method with the namespace
# puts A::method_A # Cannot access method_A like a constant with the namespace
puts "Module A "

# Modules cannot be declared as self module << self

# To make it module methods similar to class method and access
# it just by the namespace identifiers
# we need to use self

module GhostMS
  def self.reflect
    self
  end
end
puts GhostMS.reflect == GhostMS # => true

class Goo
  extend A
end

# puts Goo.attribute1  # cannot access because it is attribute1 is a instance variable
# puts Goo.Constant1 # Cannot access CONSTANT1 like a method with the namespace
# puts Goo.attribute1 # Cannot access attibute1 like a method with the namespace
# puts Goo::attribute1 # Cannot access attibute1 like a constant with the namespace
# puts Goo.constant2 # Cannot access constant2 like a method with the namespace
# puts Goo::constant2 # Cannot access constant2 like a constant with the namespace
# puts Goo.method_A # Cannot access method_A like a method with the namespace
# puts Goo::method_A # Cannot access method_A like a constant with the namespace
b = Goo.new
# b.attribute1 it did not know the attribute1

b.extend(A)
b.attribute1 # passed but no value was returned

module Plg
  @age = 12
  city = 'Dubai'

  def self.name1
    building= 'Burj'
    puts "inside plg self.name"
    @names = "john smith" #config.send("names")
    @postcode = "Dubai main road"
  end

  def address1
    borough = 'UA'
    @address = "Dubai salai"
  end

  def config
    puts "inside plg config "
    @config ||= configuration
  end

  def configure
    puts "inside plg configure"
    @config ||= Configuration.new
    yield(@config) if block_given?
    @config
  end

  class Configuration
    attr_accessor :names

    def initialize
      puts "inside plg configuration intialize"
      @names = "John smith"
    end
  end
end

# puts "plg instance variable age declared outside not inside any methods is #{Plg.age}" # undefined method `age' for Plg:Module
# puts "plg non instance variable city declared outside not inside any methodd is #{Plg.city}" # undefined method `city' for Plg:Module
puts "plg instance variable postcode declared inside self methdod is #{Plg.postcode}"
puts "plg non instance variable building declared inside self methdod is #{Plg.building}"
puts "plg instance variable address declared inside non-self methdod is #{Plg.address}"
puts "plg non instance variable borough declared inside non-self methdod is #{Plg.borough}"

puts "plg name is #{Plg.names}" # it does not complain becuse it is defined
# inside the self class, but the value is empty
Plg.name
puts "plg postcode is #{Plg.postcode}" # it does not complain becuse it is defined
# inside the self class, but the value is empty
puts "end of plg name"
puts "plg address is #{Plg.address}" # fails as it is declared outside self
# so it is a instance variable of the object that extends it

puts "plg age is #{Plg.age}" # fails as it is declared outside self
# so it is a instance variable of the object that extends it


