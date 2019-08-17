# Class cannot be extended or included
# Only modules can be extended and included
# Class can extend and include a module
# module can include or extend another module

# Components inside modules by default or neither module methods or instance methods.
# That is
# you cannot access componentent of a module just by using the modulename identifier
# Refer to moduel_components_scope.rb

# In short when an instance of a class is extending a module using the extend method,
# similar name methods in the class are overridded by the ones in the module
# module1
#    def print_it()
#       puts "inside Module1 "
#    end
# end
# class A
#    def print_it()
#       puts "inside class A"
#    end
# end
# b = A.new
# b.extends(module1)
# Refer to object_extends_modules.rb

# In short when a class extends a module using the extend keyword,
# 1) It is added as a class methods for that class
# 2) similar name methods in the class are overridded by the ones in the module
# 3) Instance of the class does not gets impacted that is instance of the class cannot access
#   the methods from the extended module and the instance have the not overrideden version that is
#   they still see the similar method with the original class declaration.
#    This is due to the fact that instance of a class cannot access its own class methods
# module1
#    def print_it()
#       puts "inside Module1 "
#    end
#    def module_exclusive
#      puts "This is present only in the module"
#    end
# end
# class A extends module1
#    def print_it()
#       puts "inside class A"
#    end
#    def class_exclusive
#      puts "Only in the class"
#    end
# end
# A.print_it  => inside Module1
# A.class_exclusive => Fails, it is not a class method
# b = A.new
# b.print_it => Inside class A
# b.class_exclusive => "Only in the class"
# b.module_exclusive => fails because it is not visible to class instance since insatnces cannot access class methods

# # Refer to class_extends_modules.rb




