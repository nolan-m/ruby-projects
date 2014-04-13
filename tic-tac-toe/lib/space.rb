class Space

attr_reader(:spot,:marked)

  def initialize(spot)
    @spot = spot
    @marked = ""
  end

  def marked_by(player)
    @marked = player
  end

  def Space.create(spot)
    new_space = Space.new(spot)
  end

end
