require 'notelist'

describe 'notelist' do
  it 'stores a note' do
    nl = Notelist.new
    nl.new_note("Eat cheese")
    expect(nl.list).to eq ["Eat cheese"]
  end
end