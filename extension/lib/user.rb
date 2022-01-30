require './notelist'

class User
  attr_reader :name, :password, :locked
  def initialize(name, password, notelist = Notelist)
    @name = name
    @password = password
    @notelist = notelist.new
    @locked = true
  end

  def login(entered_password)
    raise "Incorrect password" unless check_password(entered_password)
    @locked = false
    "Login successful"
  end

  def check_password(entered_password)
    @password == entered_password
  end

  def list_notes
    raise "User is locked" if @locked
    @notelist.list.join("; ")
  end

  def add_note(content)
    raise "User is locked" if @locked
    @notelist.new_note(content)
  end

  def lock
    @locked = true
  end

end 