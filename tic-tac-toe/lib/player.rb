class Player

attr_reader(:name, :spots)

  def initialize(name)
    @name = name
    @spots = []
  end

  def Player.create(name)
    new_player = Player.new(name)
  end

end
