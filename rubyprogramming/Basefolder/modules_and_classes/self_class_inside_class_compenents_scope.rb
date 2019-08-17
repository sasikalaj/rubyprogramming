

class SelfClass
  class << self
    attr_reader :attribute1

    Constant1 = "Constant1 in A"
    constant2 = "constant2 in A"
    @attribute1 = "Value for attribute1"

    def method_A
      "Inside Method_A in Selfclass"
    end

    def method_b
      @attribute1 = "This is attribute1 set inside SelfClass in methodb"
      return true
    end
  end

  attr_reader :attribute2

  def instance_exclusive
    puts "This is instance exclusive"
  end

  def instance_attr_reader
    @attribute1 = "Value for attribute1 from instance attr_reader"
    @attribute1
  end

  def instance_att_reader2
    @attribute2 = "ha ha ha"
  end
end


puts "Class  SelfClass "
# puts SelfClass::Constant1 # failed
# puts SelfClass.Constant1 # Cannot access CONSTANT1 like a method with the classname
# puts SelfClass.constant2 # Cannot access constant2 like a method with the classname
# puts SelfClass::constant2 # Cannot access constant2 like a constant with the classname

puts SelfClass.attribute1 # passed, but did not print any value
puts SelfClass::attribute1 #  passed, but did not print any value
puts SelfClass::method_b # Once this is called it returns true and prints true here also sets the attribute1, So subsequent call to attribute1 prints the valie
puts SelfClass.attribute1 # passed, printed the correct value
puts SelfClass.method_A # passed and printed "Inside Method_A in Selfclass"
puts SelfClass::method_A # passed and printed "Inside Method_A in Selfclass"
#puts SelfClass.attribute2 # failed, since att2 is not class attirbute, it is instance attr
# puts SelfClass::instance_exclusive # fails Since this is not a class method, you cannot access just with classname

puts "*********  Selfclass instance "
selfclass = SelfClass.new
puts selfclass.instance_exclusive # => Since it an instabxe method and not class method it is accessible from intance
puts selfclass.instance_attr_reader # => Can access since it is accessed via the instance_attr_reader
puts selfclass.attribute2
puts selfclass.instance_att_reader2
puts selfclass.attribute2
# puts selfclass.attribute1 # => instance object cannot access since it is defined inside the class << self
# puts selfclass.method_A # => instance object cannot access
# puts selfclass.method_B =>  # => instance object cannot access


puts "Class  SelfClass "


class AccountHelper
  attr_reader :personal_email

  def set_personal_email
    @personal_email = "My personal email"
  end

  class << self
    attr_reader :personal_password
  end

  def self.load
    @email = nil
    @password = nil


    class << self
      attr_reader :email
    end

    class << self
      attr_reader :password
    end

    attr_reader :gmail

    @email = "dummy@gmail.com"
    @password = "password1"
    @gmail = "abc@gmail.com"
    @personal_email = "personal@gmail.com"
    @personal_password = "passwordpersonal"
  end
end

puts "************** Account helper ******************"
# puts AccountHelper.email # => fails undefined because it is only inside the class method load
# puts AccountHelper.password # => fails undefined because it is only inside the class method load
# puts AccountHelper.gmail # => fails undefined because it is only inside the class method load
 # puts AccountHelper.personal_email # fails since it is not class method
 puts AccountHelper.personal_password # passes but no value

AccountHelper.load
puts AccountHelper.email # passed as the load method is called now
puts AccountHelper.password # passed as the load method is called now
# puts AccountHelper.gmail # fails undefined because it is only inside the class method load and not declared as self
# puts AccountHelper.personal_email # fails since it is not class method
puts AccountHelper.personal_password

accounthelper = AccountHelper.new
#accounthelper.load # private method called for instance
puts accounthelper.personal_email
accounthelper.set_personal_email
puts accounthelper.personal_email

