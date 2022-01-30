require 'socket'
require './notelist'
require './users'

server = TCPServer.new(2345)

socket = server.accept

# nl = Notelist.new

users = Users.new

  # socket.puts 'Enter a note with "new note", list notes with "list", quit with "quit"'

  socket.puts 'Type name to login'

  name = socket.gets.chomp

loop do

  if users.list_users.include? "#{name}"

    user = users.find_user(name)

    socket.puts 'Type password to login'

    password = socket.gets.chomp

  else !users.list_users.include? "#{name}"

    socket.puts 'New user! Enter a password'

    password = socket.gets.chomp

    users.add_user(name, password)
  
  end

  if user.check_password(password)

    socket.puts 'Choose your option: new note, list, lock list'

    they_said = gets.chomp

    if they_said == "new note"

      socket.puts 'Enter note content'
  
      content = socket.gets.chomp
      
      user.notelist.new_note(content)
  
    elsif they_said == "list"
  
      socket.puts user.notelist.list

    elsif they_said == "lock list"
  
      socket.puts user.lock
  
    end

  else

    socket.puts 'Password incorrect'

    interact

  end

end


# run server on the host
# on the client "telnet [ipaddress] [port]"
# can interact with server over local network