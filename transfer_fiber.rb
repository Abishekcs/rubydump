@f1 = Fiber.new do
  puts 'Hi from f1'
  @f2.transfer
  puts 'Hi again from f1'
end

@f2 = Fiber.new do
  puts 'Hi from f2'
  @f1.transfer
end

puts 'Hi from main fiber'
@f1.transfer
puts 'Bye from main fiber'
