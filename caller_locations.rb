def check_caller
  locations = caller_locations
  puts "I was called from:"
  locations.first(3).each do |location|
    puts " File: #{location.path}"
    puts " Line: #{location.lineno}"
    puts " Method #{location.label}"
    puts "---"
  end
end

def outer_method
  check_caller
end

outer_method

