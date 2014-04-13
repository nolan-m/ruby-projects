require ('rspec')
require ('nth_prime')

describe("nth_prime") do
  it("returns the nth of a inputed number") do
    nth_prime(2).should(eq(3))
  end
end
