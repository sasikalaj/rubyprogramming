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


