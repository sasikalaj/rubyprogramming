class Sample1
  # attr_reader :attribute1

  Constant1 = "Constant1 in A"
  constant2 = "constant2 in A"
  @attribute1 = "Value for attribute1"

  def method_A
    puts "Inside Method_A in Class Sample"
  end
end


puts "Class  Sample1 "
puts Sample1::Constant1 # passed
# puts Sample.Constant1 # Cannot access CONSTANT1 like a method with the classname
# puts Sample.attribute1 # Cannot access attibute1 like a method with the classname. Says undefined method attribute
# puts Sample::attribute1 # Cannot access attibute1 like a constant with the classname
# puts Sample.constant2 # Cannot access constant2 like a method with the classname
# puts Sample::constant2 # Cannot access constant2 like a constant with the classname
# puts Sample.method_A # Cannot access method_A like a method with the classname
# puts Sample::method_A # Cannot access method_A like a constant with the classname
puts "Class  Sample1 "

class Foos
 # extend Sample1 -- classes cannot be extended
end

g = Foos.new

g.attribute1
