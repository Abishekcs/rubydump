def Del(mid)
  lambda do |x, &block|
    block.call
    puts mid, x 
  end
end

final_del = Del('Hello').call('World') { puts 'Testing Block'} 

