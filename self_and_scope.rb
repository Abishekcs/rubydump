puts "Top Level"
puts "self is #{self}"

class C
  puts "Class Definition Block:"
  puts "self is #{self}"
end

c_instance = C.new

module Hello
  puts "Module Definition Block:"
  puts "self is #{self}"
end

class A
  include Hello
end

def greetings
  puts "Hello from greetings mate #{self}"
end

greetings


class Test
  def test_self
    puts "Self of instance method is #{self}"
  end
end

test_sample = Test.new

test_sample.test_self
