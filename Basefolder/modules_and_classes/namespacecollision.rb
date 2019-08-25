


# A Ruby module is nothing more than a grouping of objects under a single name.
# The objects may be constants, methods, classes, or other modules.
#
# Modules have two uses. You can use a module as a convenient way to bundle objects together,
# or you can incorporate its contents into a class with Ruby’s include statement.
# When a module is used as a container for objects, it’s called a namespace.
# Ruby’s Math module is a good example of a namespace: it provides an overarching structure for constants like Math::PI
# and methods like Math::log, which would otherwise clutter up the main Kernel namespace. We cover this most basic
# use of modules in Recipes 10.5 and 10.7.

# Problem-1
# You want to define a class or module whose name conflicts with an existing class or module,
# or you want to prevent someone else from coming along later and defining a class whose name conflicts with yours.

module Namespace1
  puts "Inside Namespace1"
  Constant_1 = "Hello world"
  puts Constant_1
  puts Namespace1::Constant_1
  # run time error uninitialise constant Namespace1::Namespace2 contant1
  # puts Namespace2::Constant_1
  class Namespace1_class
    puts "i am NM1 class "
    def Nm1_class
      puts "I am inside a class module of Namespace1"
    end
  end
end


module Namespace2
  puts "Inside Namespace2"
  Constant_1 = "Hi world"
  puts Constant_1
  puts Namespace1::Constant_1
end
puts "******* for accessing constants outside"
puts Namespace1::Constant_1
puts Namespace2::Constant_1
puts "******* for accessing constants outside"

module Namespace3
  puts Namespace1::Constant_1
  puts Namespace2::Constant_1

end

module StringTheory2
  RubyString = String
  class String
    def initialize(length=10**-33)
      @length = length
    end
  end
  puts "Inside Stringthrory2"
  puts RubyString.new("This is a built-in string, not a StringTheory2::String")
end

puts String.new("I am original")

puts StringTheory2::String.new("I am from String theory2")

# Problem-2
# You want to use the objects within a module without constantly qualifying the object names with the name of their module.
# Solution
# Use include to copy a module’s objects into the current namespace.
# You can then use them from the current namespace, without qualifying their names.

class For_modules
  include Namespace1
  # Trying to access the NM1 contant without qaalifier - pass
  puts Constant_1
  # You cannot access the NM2 cosntant without qualiier so use namespace. - works
  puts Namespace2::Constant_1

  def print_namespace_contants()
     puts Constant_1
     puts Namespace2::Constant_1

  end
  # This the ckass that is defined within the MN1
  # You can create a new class of it with specifiying the qailifier and access its methods.
  # This is as equal to have having the class definition within itself
  b = Namespace1_class.new # passed
  b.Nm1_class # passed
  # Nm1_class - This failed
  # Namespace1_class.Nm1_class - failed

end
 puts "ourside class"
modules_name = For_modules.new
modules_name.print_namespace_contants
# puts modules_name.Constant_1  failed
# modules_name.Nm1_class failed
# modules_name.Namespace1_class.Nm1_class
