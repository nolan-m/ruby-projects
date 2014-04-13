class Email

@@all_emails = []

  def Email.clear
    @@all_emails = []
  end

  def Email.all
    @@all_emails
  end

  def Email.create(email)
    new_email = Email.new(email)
    @@all_emails << new_email
    new_email
  end

  def initialize(email)
    @email = email
  end

  def email
    @email
  end

  def edit_email(email)
    @email = email
  end


  def save
    @@all_emails << self
  end

end
