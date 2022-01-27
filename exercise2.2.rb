require 'socket'

server = TCPServer.new(2345)

socket = server.accept

loop do

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  socket.puts "You said: #{they_said}. Goodbye!"

end

socket.close

# Must close server using control c, no exit possibile otherwise?