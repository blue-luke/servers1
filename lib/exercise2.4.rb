require 'socket'
require './notelist'

server = TCPServer.new(2345)

socket = server.accept

nl = Notelist.new

loop do

  socket.puts 'Enter a note with "new note", list notes with "list", quit with "quit"'

  they_said = socket.gets.chomp

  if they_said == "quit"

    socket.close

  elsif they_said == "new note"

    socket.puts 'Enter note content'

    content = socket.gets.chomp
    
    nl.new_note(content)

  elsif they_said == "list"

    socket.puts nl.list

  end

end

socket.close

# run server on the host
# on the client "telnet [ipaddress] [port]"
# can interact with server over local network