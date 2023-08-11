require 'socket'
require 'optparse'

opt = OptionParser.new
option = {}
opt.on('-l') { |l| option[:l] = l }
argv = opt.parse(ARGV)




if option[:l]
  host = ARGV[1]
  port = ARGV[2]
  puts "DEBUG: host='#{host}' port='#{port}'"
  server = TCPServer.new "#{host}","#{port}"
  loop do
    puts "DEBUG: accept..."
    connection = server.accept
    puts "DEBUG: accepted"
    string = connection.gets
    print string
  end
else
  host = ARGV[0]
  port = ARGV[1]
  puts "DEBUG: host='#{host}' port='#{port}'"
  s = TCPSocket.new "#{host}", "#{port}"
  loop do
    string = $stdin.gets
    s.print(string)
  end
end

s.close
