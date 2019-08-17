#!/usr/local/bin/ruby
def owner(iv)
    ObjectSpace.each_object(Class).select { |c| c.instance_variables.include?(iv) }
end
module Other
    class Otherclass
            def access_instance_variable
                @simple = "simple"
                puts  'inside other class record'
            end
    end
end

#Parentclass::Base.instance_variable

#otherClass = Other::Otherclass.new
#
#otherClass.access_instance_variable

owner @simple
