require 'socket'
require 'optparse'

opt = OptionParser.new
option = {}
opt.on('-l') { |l| option[:l] = l }
argv = opt.parse(ARGV)

host = argv[0]
port = argv[1]
puts "DEBUG: host='#{host}' port='#{port}'"

if option[:l]
  server = TCPServer.new "#{host}","#{port}"
  loop do
    puts "DEBUG: accept..."
    connection = server.accept
    puts "DEBUG: accepted"
    loop do
      string = connection.gets
      print string
    end
  end
else
  s = TCPSocket.new "#{host}", "#{port}"
  loop do
    string = $stdin.gets
    s.print(string)
  end
end

s.close
