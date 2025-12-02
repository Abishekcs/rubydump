class C
  puts "Just started class C:"
  puts self # Output: C

  module M
    puts "Nested module C::M"
    puts self # Output: C::M
  end

  puts "Back in outer level of C:"
  puts self #Output: C
end
