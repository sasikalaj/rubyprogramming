# Components inside modules by default or neither module methods
# or instance
# methods. That is
# you cannot access componentent of a module just by using the
# modulename identifier
# Contant here is a `global factor so we are able to access them `

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

# To make it module metjods similar to class method and access
# it jusy by the namespace identifiers
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

# Goo.attribute1
b = Goo.new
# b.attribute1 it did not know the attribute1

b.extend(A)
b.attribute1 # passed but no value was returned
