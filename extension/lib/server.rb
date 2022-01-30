require 'socket'
require './notelist'
require './users'
require './user'

server = TCPServer.new(2345)

socket = server.accept

users = Users.new

user = nil

# need an identified user. What if someone chooses 5 without logging in?

loop do

  if user
    socket.puts "Make your selection using numbers:\n
    1. Add user\n
    2. List users\n
    3. Find user\n
    4. Login as user\n
    5. Add note\n
    6. List notes\n
    7. Lock
    "
  else
    socket.puts "Make your selection using numbers:\n
    1. Add user\n
    2. List users\n
    3. Find user\n
    4. Login as user
    "
  end
  input = socket.gets.to_i
  case input
    when 1
      socket.puts "Enter new username"
      name = socket.gets
      socket.puts "Enter password"
      password = socket.gets
      users.add_user(name, password)
    when 2
      socket.puts users.list_users
    when 3
      socket.puts "Enter username to search for"
      name = socket.gets
      users.find_user(name)
      if name
        socket.puts "User is found, login as #{name}"
      else
        socket.puts "User not found"
      end
    when 4 
      socket.puts "Enter username to login as"
      name = socket.gets
      user = users.find_user(name)
      unless user
        socket.puts "User not found"
      else
        socket.puts "Enter user password"
        password = socket.gets
        user.login(password)
      end
    when 5
      unless user 
        socket.puts "No logged in user"
      else 
        socket.puts "Enter note content"
        content = socket.gets
        user.add_note(content)
      end
    when 6
      unless user
        socket.puts "No logged in user"
      else 
        socket.puts user.list_notes
      end
    when 7
      unless user
        socket.puts "No logged in user"
      else
        user.lock
        user = nil
      end
  end
end