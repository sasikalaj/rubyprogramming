# The :: is a unary operator that allows: constants, instance methods and class methods defined within a
# class or module, to be accessed from anywhere outside the class or module.

# :: is basically a namespace resolution operator. It allows you to access items in modules,
# or class-level items in classes. For example, say you had this setup:
#
# module SomeModule
#  module InnerModule
#   class MyClass
#     CONSTANT = 4
#   end
#  end
# end                                                                                                                                           end
# You could access CONSTANT from outside the module as SomeModule::InnerModule::MyClass::CONSTANT.
#
# It doesn't affect instance methods defined on a class, since you access those with a different syntax (the dot .).
#
# Relevant note: If you want to go back to the top-level namespace, do this: ::SomeModule – Benjamin Oakes

# MR_COUNT = 0        # constant defined on main Object class
# module Foo
#   MR_COUNT = 0
#   ::MR_COUNT = 1    # set global count to 1
#   MR_COUNT = 2      # set local count to 2
# end
#
# puts MR_COUNT       # this is the global constant
# puts Foo::MR_COUNT  # this is the local "Foo" constant

# The :: operator does not allow you to bypass visibility of methods marked private or protected.


module DoubleColon
  Constant1 = 90
  constant2 = 91


end
