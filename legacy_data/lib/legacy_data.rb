hash = { 1  => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  2  => ["D", "G"],
  3  => ["B", "C", "M", "P"],
  4  => ["F", "H", "V", "W", "Y"],
  5  => ["K"],
  8  => ["J", "X"],
  10 => ["Q", "Z"]
}

def legacy_data(hash)
  hash_results = []

  hash.each do|key, value|
    value.map!{|c| c.downcase}
    array = hash[key]
    change = Hash[array.map {|x| [x, key]}]
    hash_results << change
  end
  hash_results.inject(:merge)
end

print legacy_data(hash)
