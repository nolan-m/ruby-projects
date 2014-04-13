require('rspec')
require('legacy_data')

describe('legacy_data') do
  it('should return {"a" => 1} when {1 = ["a"]} is inputted') do
    legacy_data({1 => ['a']}).should(eql({'a' => 1}))
  end
  it('should return {"a" => 1, "e" => 1} when {1 = ["a", "e"]} is inputted') do
    legacy_data({ 1  => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2  => ["D", "G"],
  3  => ["B", "C", "M", "P"],
  4  => ["F", "H", "V", "W", "Y"],
  5  => ["K"],
  8  => ["J", "X"],
  10 => ["Q", "Z"]
}).should(eql({ "a" => 1, "b" => 3,  "c" => 3, "d" => 2, "e" => 1,
  "f" => 4, "g" => 2,  "h" => 4, "i" => 1, "j" => 8,
  "k" => 5, "l" => 1,  "m" => 3, "n" => 1, "o" => 1,
  "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
  "u" => 1, "v" => 4,  "w" => 4, "x" => 8, "y" => 4,
  "z" => 10
}))
  end
end
