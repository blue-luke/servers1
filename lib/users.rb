require 'user'

class Users 
  def initialize(user = User)
    @all_users = []
    @user = User
  end
  def add_user(name, password)
    @all_users.append(@user.new(name, password))
  end
  def list_users
    @all_users.map { |x| x.name }.join(" ")
  end
end