# Inside of an instance method
# In the code below, reflect is an instance method. It belongs to the object we created via Ghost.new. So self points to that object.

class Ghost
  def reflect
      self
  end
end

puts "Inside of an instance method"

g = Ghost.new
puts g.reflect == g # => true


# Inside of a class method
# For this example, reflect is a class method of Ghost.
# With class methods, the class itself "owns" the method. self points to the class.

class Ghost1
  def self.reflect
    self
  end
end

puts "Inside of a class method"
puts Ghost1.reflect == Ghost1 # => true

# It works the same with "class" methods inside of modules. For example:
module GhostM
  def self.reflect
    self
  end
end
puts "Module self methods "
puts GhostM.reflect == GhostM # => true

module GhostM1
  def reflect
    self
  end
end
# puts GhostM1.reflect == GhostM1
# => undefined method as there is no instance method aconecpt in module since modules cannot be instantaited

# Remember, classes and modules are treated as objects in Ruby.
# So this behavior isn't that different from the instance method behavior we saw in the first example.

# Inside of a class or module definition
# One feature of Ruby that makes it such a good fit for frameworks like Rails is that you can execute
# arbitrary code inside class and module definitions. When you put code inside of a class/module definition,
# it runs just like any other Ruby code. The only real difference is the value of self.

# As you can see below, self points to the class or module that's in the process of being defined.

puts "Class and module self reference"
class GhostC
  puts self == GhostC # => true
end

module Mummy
  puts self == Mummy # => true
end

# Inside mixin methods
# Mixed-in methods behave just like "normal" instance or class methods when it comes to self.
# This makes sense. Otherwise the mixin wouldn't be able to interact with the class you mixed it into.

# Instance methods
# Even though the reflect method was defined in the module, its self is the instance of the class it was mixed into.
puts "mixin methods "
module Reflection
  def reflect
    self
  end
end

class GhostD
  include Reflection
end

g = GhostD.new
puts g.reflect == g # => true
# Class methods
# When we extend a class to mix in class methods, self behaves exactly like it does in normal class methods.
puts "Inside class extends module methods "
module Reflection1
  def reflect
    self
  end
end

class GhostE
  extend Reflection1
end

puts GhostE.reflect == GhostE # => true

# Inside the metaclass
# Chances are you've seen this popular shortcut for defining lots of class methods at once.

class GhostF
  class << self
    def method1
      self
    end

    def method2
      self
    end
  end
  def method3
    self
  end
end
puts "Inside the metaclass"
puts GhostF.method1 == GhostF # => true
puts GhostF.method2 == GhostF # => true
# puts GhostF.method3 == GhostF # => not defined as it is an instanc method
gf =   GhostF.new
puts gf.method3 == gf # => true

puts "inside  - class << self inside the module "

module GhostFM
  class << self
    def method1
      self
    end

    def method2
      self
    end
  end
  def method3
    self
  end
end

puts GhostFM.method1 == GhostFM # => true
puts GhostFM.method2 == GhostFM # => true
# puts GhostFM.method3 == GhostFM # => not defined as it is niether instance nor class method

puts "inside  - Class that extends a module with class << self"

class ClassFM
   extend GhostFM
end

# puts ClassFM.method1 == ClassFM # => undefined as self methods in modules are like private and does not gets exteneded or included
# puts ClassFM.method2 == ClassFM # => undefined as self methods in modules are like private and does not gets exteneded or included
puts ClassFM.method3 == ClassFM # => true

classFM = ClassFM.new
# puts classFM.method1 == classFM # => undefined as self methods in modules are like private and does not gets exteneded or included
# puts classFM.method2 == classFM # => undefined as self methods in modules are like private and does not gets exteneded or included


puts "inside  - Class that includes a module with class << self"
class ClassIM
  include GhostFM
end

classIM = ClassIM.new
# puts ClassFM.method1 == ClassFM # => undefined as self methods in modules are like private and does not gets exteneded or included
# puts ClassFM.method2 == ClassFM # => undefined as self methods in modules are like private and does not gets exteneded or included
# puts classIM.method1 == classIM # => undefined as self methods in modules are like private and does not gets exteneded or included
# puts classIM.method2 == classIM # => undefined as self methods in modules are like private and does not gets exteneded or included
puts classIM.method3 == classIM # => true

puts "Inside def self.method inside the module"

module GhostH
  def self.reflect
    self
  end

  def normal
    self
  end

end

puts GhostH.reflect == GhostH # => true

class Dummy
  extend GhostH
end

# puts Dummy.reflect == Dummy # failed - undefined method refelct for Dummy
puts Dummy.normal == Dummy
dummy = Dummy.new
# puts dummy.reflect == dummy # failed - undefined method refelct for Dummy
# puts dummy.normal == dummy # failed - undefined method refelct for Dummy

puts "Inside def self.method inside the module"

class Dummy1
  include GhostH
end

# puts Dummy1.reflect == Dummy1 # failed - undefined method refelct for Dummy
# puts Dummy1.normal == Dummy1 # failed - undefined method refelct for Dummy
dummy1 = Dummy1.new
# puts dummy1.reflect == dummy1 # failed - undefined method refelct for Dummy
puts dummy1.normal == dummy1 # passed



# The class << foo syntax is actually pretty interesting. It lets you access an object's metaclass -
# which is also called the "singleton class" or "eigenclass." I plan on covering metaclasses more deeply
# in a future post. But for now, you just need to know that the metaclass is where Ruby stores methods that
# are unique to a specific object
# If you access self from inside the class << foo block, you get the metaclass.

puts "Inside the metaclass for << "
class << "test"
  puts self.inspect
end

# # => #<Class:#<String:0x007f8de283bd88>
# Outside of any class
# If you're running code outside of any class, Ruby still provides self.
# It points to "main", which is an instance of Object:

puts self.inspect # => main
