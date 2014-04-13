require 'rspec'
require 'board'
require 'space'
require 'game'
require 'player'


describe Player do
  it 'should initialize a player with a name' do
    test_player = Player.new('Player_X')
    test_player.should be_an_instance_of Player
  end
  describe '.create' do
    it 'should create an instance of the class and initializes' do
      test_player = Player.create('Player_X')
      test_player.spots.should eq []
      test_player.should be_an_instance_of Player
    end
  end
end

describe Space do
  it 'should initialize with coordinate x and y' do
    test_space = Space.new(1)
    test_space.should be_an_instance_of Space
    test_space.spot.should eq 1
  end
  it 'should tell if a space is marked by a player'do
    test_space = Space.create(1)
    test_player = Player.create('Player_X')
    test_space.marked(test_player).should eq test_player
  end
  describe '.create' do
    it 'should create an instance of the class and initializes' do
      test_space = Space.create(1)
      test_space.should be_an_instance_of Space
    end
  end
end

describe Board do
  it 'should be initialized with an empty array' do
    test_board = Board.new
    test_board.spaces.should eq []
  end
  describe '.find' do
    it 'should return the space object that matches the inputter coords' do
      test_board = Board.new
      test_space1 = Space.new(2)
      test_space2 = Space.new(1)
      test_board.add_space(test_space1)
      test_board.add_space(test_space2)
      test_board.find(1).should eq test_space2
    end
  end
end
