require 'user'

describe 'User' do
  it 'has a username' do
    u = User.new("James")
    expect(u.name).to eq "James"
  end
end