class Notelist
  attr_reader :list
  def initialize
    @list = []
  end
  def new_note(content)
    @list.append(content)
  end
end