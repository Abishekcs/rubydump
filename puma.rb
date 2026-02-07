require "puma"
require "puma/puma_http11"

def time
  x = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  yield
  Process.clock_gettime(Process::CLOCK_MONOTONIC) - x
end

parser = Puma::HttpParser.new
req = {}
20.times do |i|
  data = "x" * (1024 << i)
  buff = "GET / HTTP/1.1\r\nX-#{data}: foo\r\n\r\n"
  p time {
    begin
      parser.execute(req, buff, 0)
    rescue Puma::HttpParserError => e
    end
    parser.reset
  }
end
