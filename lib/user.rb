class User
  attr_reader :name, :password
  def initialize(name, password)
    @name = name
    @password = password
  end

  def check_password(entered_password)
    @password == entered_password
  end

end 