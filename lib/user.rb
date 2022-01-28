require './notelist'

class User
  attr_reader :name
  def initialize(name, password, notelist = Notelist)
    @name = name
    @password = password
    @notelist = notelist.new
    @unlocked = false
  end

  def check_password(entered_password)
    @password == entered_password
    @unlocked = true
  end

  def notelist
    raise "User is locked" unless @unlocked
    @notelist
  end

  def lock
    @unlocked = false
  end

end 