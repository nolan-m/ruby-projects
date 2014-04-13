require('rspec')
require('prime_numbers')

describe('prime_numbers') do
  it("Inputs a number and places every number lower than it in an array") do
    prime_numbers(3).should(eq([2,3]))
  end
  it("Inputs a number and places every number lower than it in an array") do
    prime_numbers(18).should(eq([2, 3, 5, 7, 11, 13, 17]))
  end
end
