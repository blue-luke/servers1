require 'socket'

server = TCPServer.new(2345)

socket = server.accept
loop do
socket.puts "HELLO CLIENT WHAT IS YOUR NAME?"
name = socket.gets.chomp
socket.puts "THAT'S A LOVELY NAME #{name}"
end
socket.close