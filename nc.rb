require 'socket'
host = ARGV[0]
port = ARGV[1]

puts "DEBUG: host='#{host}' port='#{port}'"
s = TCPSocket.new "#{host}", "#{port}"

loop do
  string = $stdin.gets
  s.print(string)
end

s.close
