class Sample
  def greetings=(message)
    puts message
  end
end

s = Sample.new
s.greetings = 'Hello World'
