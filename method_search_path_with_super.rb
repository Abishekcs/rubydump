module M
  def report
    puts "'report' method in module M"
  end
end

module N
  def report(name)
    puts "Hi #{name}, I am module N"
  end
end

class C
  include M
  include N

  def report(name)
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    super
    puts "Back from the 'super call.'"
  end
end

c = C.new
c.report('Abishek')
