class Board

attr_reader(:spaces)

  def initialize
    @spaces = []
  end

  def add_space(space)
    @spaces << space
  end

  def find(spot)
    found = self.spaces.find {|space| space.spot == spot }
    return found
  end

end
