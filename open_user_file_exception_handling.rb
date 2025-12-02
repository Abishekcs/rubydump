open_user_file do |filename|
  fh = File.open(filename)
  yield fh
  fh.close
  rescue
    puts "Couldn't open your file"
end

open_user_file('my_name') { |fh| puts "Checking if it works"}
