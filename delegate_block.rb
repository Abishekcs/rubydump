def delegating_block(mid)
  lambda do |*args, &blocks|
    blocks.call
    puts "And my value is passed with call like #{args}"
    puts "I after block call what's up & #{mid}"
end.ruby2_keywords
end

db_sample = delegating_block('Hello World') 

puts db_sample

db_sample.call('Hello Wolrd of args') { puts 'I am the block'}




