require 'user'

describe 'User' do
  it 'has a username' do
    u = User.new("James", "123456")
    expect(u.name).to eq "James"
  end
  # it 'has a password' do
  #   u = User.new("James", "123456")
  #   expect(u.password).to eq "123456"
  # end
  # it 'can check an entered password matches actual password' do
  #   u = User.new("James", "123456")
  #   expect(u.check_password("123457")).to eq false
  # end
  it 'entering correct password unlocks notelist' do
    notelist_double = double("notelist")
    notelist_class_double = double("Notelist", :new => notelist_double)
    u = User.new("James", "123456", notelist_class_double)
    u.check_password("123456")
    expect(u.notelist).to eq notelist_double
  end
end