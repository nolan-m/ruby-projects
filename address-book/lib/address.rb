class Address
  @@all_addresses = []

  def Address.clear
    @@all_addresses = []
  end

  def Address.all
    @@all_addresses
  end

  def Address.create(address)
    new_address = Address.new(address)
    @@all_addresses << new_address
    new_address
  end

  def initialize(address)
    @address = address
  end

  def address
    @address
  end

  def edit_address(address)
    @address = address
  end


  def save
    @@all_addresses << self
  end

end
