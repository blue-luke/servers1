require 'users'

describe 'Users' do
  it 'lists usernames' do
    user_double = double("User", :name => "Jane", :password => "123456")

    u = Users.new
    u.add_user(user_double.name, user_double.password)

    expect(u.list_users).to eq "Jane"
  end
  # More methods are here
end