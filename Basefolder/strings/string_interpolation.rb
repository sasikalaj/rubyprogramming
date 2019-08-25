# Below is all to escape the special characters while using the single or double quotes

puts "Backslashes (\\) have to be escaped in double quotes."
puts 'You can just type \ once in a single quoted string.'
puts "But whichever type of quotation mark you use..."
puts "...you have to escape its quotation symbol, such as \"."
puts 'That applies to \' in single-quoted strings too.'
puts 'Backslash-n just looks like \n between single quotes.'
puts "But it means newline\nin a double-quoted string."
puts 'Same with \t, which comes out as \t with single quotes...'
puts "...but inserts a tab character:\tinside double quotes."
puts "You can escape the backslash to get \\n and \\t with double quotes."


# Another notation for string for single quotes it is %q

puts "******** for q notation"

puts %q{You needn't escape apostrophes when using %q.}

# Another notation for string for doubke quotes %Q

puts  %Q{Another string}

# you can use any delimiter

puts %q-A string-
puts %Q/Another string/
puts %[Yet another string]  # this is actually for double quoted string

puts [%q Hello! ] # this works even though there is compilation error

puts [%q Hello\ there! ] # this works even though there is compilation error
puts %q-Better escape the \- inside this string!-

puts %Q[I can put [] in here unescaped.]
puts %q(I have to escape \( if I use it alone in here.)
puts %Q(And the same goes for \).)

puts "******** here-doc notation"
# here-docs
text = <<EOM
This is the first line of text.
This is the second line.
Now we're done.
EOM

puts text
# EOM can be anywhere in the middle of the line. But that should be the only char in the line
text = <<-EOM
The EOM doesn't have to be flush left!
     EOM

puts text

# usually the here-docs are double quoted , for single quoted it should be >>
text = <<-'EOM'
EOMSingle-quoted!
Note the literal \n. 
And the literal #{2+2}.
EOM
puts text


a = <<EOM.to_i * 10
5
EOM
puts a

# Here’s an example where we put a string into an array, creating the string as a here-doc:

array = [1,2,3, <<EOM, 4]
This is the here-doc!
It becomes array[3].
EOM
p array

puts "******** for substring notation"
string = "Ruby is a cool language."

p string[5]
p string
p string[5,10]

# We’ll be looking at ranges in more depth later;
# for now, you can think of n..m as all of the values between n and m,
# inclusive (or exclusive of m, if you use three dots instead of two
p string[7..14]
p string[-12..-3]
p string[-12..20]
p string[15..-1]

# It’s also possible to search for a pattern match using the [] technique with
# a regular expression—[] is a method
puts "******** for search pattern notation"
p string["cool lang"]
p string["very cool lang"]
p string[/c[ol ]+/]

puts "******** for slice notation"
p string.slice!("cool ")
p string

puts "******** for substring setting  notation"
string = "Ruby is a cool language."
p string["cool"] = "great"
p string

string[-1] = "!"
p string
string[-9..-1] = "thing to learn!"
p string

puts "**** trying + concat The string you get back from + is always a new string."

str="Hi"
p str + "there"
p str
puts "**** To add (append) a second string permenantly"


str << " there."

p str

puts "**** To add  string interpolation "

str="Hi"

p "#{str} there"


p "The sum is #{2 + 2}."

# p "My name is #{class Persons;
#   attr_accessor :name        ;
#   d = Persons.new ;
#   d.name = "David" ;
#   d.name
#     } ."
puts " Ruby querying strings"

string = "Ruby is a Cool language."
 p string.include?("Ruby") # => true
 p string.include?("English") # => false
 p string.start_with?("Ruby") # => true
 p string.end_with?("!!!") # => false
 p string.empty? # => false
 p "".empty? # => true
 p string.size # => 24
 p string.count("a") # => 3
 p string.count("a-d") # => 4
 p string.count("A-Z") # => 2
 p string.count("aey. ") # => 10
 p string.count("^aey. ") # =>14
 p string.count("^g-m") # => 19
p string.count("ag-m")# => 8
p string.count("ag-m", "^l") # => 6
p string.index("cool") # => 10
p string.index("l") # => 13
p string.rindex("l") # => 15

p "ordinal code, courtesy of the ord method"

p "a".ord # => 97
p "abc".ord # => 97
p 97.chr #=> a

p "equality check"
# Remember that the spaceship method/operator
# returns -1 if the right object is greater,
# 1 if the left object is greater, and
# 0 if the two objects are equal.


p "a" <=> "b"  # => - 1
p "b">"a"  # => true

p "a"< "A" # => false
p "string" == "string" # => true
p "string" == "house" # => false
p "a" == "a" # => true
p "a".equal?("a") # => false
p "a".equal?(100) # => false


 string = "David A. Black" # => "David A. Black"
 p string.upcase  # => "DAVID A. BLACK"
 p string.downcase # => "david a. black"
 p string.swapcase # => "dAVID a. bLACK"
string = "david"
 p  string.capitalize# => "David"

puts "chop strings "

p "David A. Black".chop
p "David A. Black\n".chomp # => default for chomp is \n
p "David A. Black".chomp("ck")

puts "strip strings "
string=" DavidA.Black "
p string.strip # => DavidA.Black"
p string.lstrip # => "DavidA.Black "
p string.rstrip # => " DavidA.Black"
puts "clear  strings "
string = "David A. Black"
string.clear
p string

puts "replace  strings "
string = "David A. Black"
string.replace("I am not David")
p string

puts "delete  strings "
string = "David A. Black"
p string.delete("David")
p string

puts "Symbols vs strings"
# The "abc" notation creates a new string each time, as you can see from the
# fact that each such string has a different object id. But the :abc notation always
# represents the same object; :abc identifies itself with the same id number no matter how many times you ask it.
p "abc".object_id
p "abc".object_id
p :abc.object_id
p :abc.object_id
# Because symbols are unique, there’s no point having a constructor for them; Ruby has no Symbol#new method.





