class Phone

  @@all_phones = []

  def Phone.clear
    @@all_phones = []
  end

  def Phone.all
    @@all_phones
  end

  def Phone.create(phone_number)
    new_phone = Phone.new(phone_number)
    @@all_phones << new_phone
    new_phone
  end

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def phone_number
    @phone_number
  end

  def edit_phone(phone_number)
    @phone_number = phone_number
  end

  def save
    @@all_phones << self
  end

end
