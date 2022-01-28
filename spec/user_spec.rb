require 'user'

describe 'User' do
  it 'has a username' do
    u = User.new("James", "123456")
    expect(u.name).to eq "James"
  end
  it 'has a password' do
    u = User.new("James", "123456")
    expect(u.password).to eq "123456"
  end
  xit 'can check an entered password matches actual password' do
    u = User.new("James", "123456")
    expect(u.check_password("123457")).to eq false
  end
end