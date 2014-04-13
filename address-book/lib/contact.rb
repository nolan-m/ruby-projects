class Contact
  @@all_contacts = []

  def Contact.all
    @@all_contacts
  end

  def Contact.clear
    @@all_contacts = []
  end

  def Contact.create(first_name, last_name)
    new_contact = Contact.new(first_name, last_name)
    @@all_contacts << new_contact
    new_contact
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @phone_number = []
    @email = []
    @address = []
  end

  def full_name
    @first_name + " " + @last_name
  end

  def save
    @@all_contacts << self
  end

  def add_extra_phone(phone_number)
    @phone_number << phone_number
  end

  def add_extra_email(email)
    @email << email
  end

  def add_extra_address(address)
    @address << address
  end

  def edit_name(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def address
    @address
  end

  def phone_number
    @phone_number
  end

  def email
    @email
  end
end
