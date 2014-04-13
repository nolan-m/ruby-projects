def prime_numbers(number)
  range = (2..number).to_a
  range.each do |prime|
    range.reject! { |num| num % prime == 0 && num != prime}
  end
   range
end

