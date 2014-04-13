def prime_numbers(number)
  range = (2..number*10).to_a
  range.each do |prime|
    if prime < Math.sqrt(number)
      range.reject! { |num| num % prime == 0 && num != prime}
    end
  end
   range[number - 1]
end

puts prime_numbers(5000)
