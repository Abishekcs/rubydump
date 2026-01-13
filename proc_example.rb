def mul(number)
  Proc.new do |x| 
    if x == 2
      break
    end
    x*number 
  end
  puts 'Hello World'
end

sample = mul(3)

puts sample.call(2)
