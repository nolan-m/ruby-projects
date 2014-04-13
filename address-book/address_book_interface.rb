require './lib/contact'
require './lib/phone'
require './lib/email'
require './lib/address'

@current_contact

def main_menu
  puts "\n"
  puts "Address Book"
  puts "-----"
  puts "Press 'V' to view all contacts or 'A' to add a new contact."
  puts "Type 'del to delete a contact."
  puts "Press 'X' to exit the program."

  main_choice = gets.chomp

  if main_choice == 'a'
    add_contact
  elsif main_choice == 'v'
    view_contacts
  elsif main_choice == 'del'
    delete_contact
  elsif main_choice =='x'
    puts "Goodbye"
  else
    puts "Invalid choice. \n"
    main_menu
  end

end

def add_contact
  puts "Enter first name:"
  first_name = gets.chomp

  puts "Enter last name:"
  last_name = gets.chomp

  puts "Enter phone number:"
  phone_num = gets.chomp

  puts "Enter email:"
  email = gets.chomp

  puts "Enter address:"
  address = gets.chomp

  new_contact = Contact.create(first_name, last_name)

  new_phone = Phone.create(phone_num)
  new_contact.add_extra_phone(new_phone)

  new_email = Email.create(email)
  new_contact.add_extra_email(new_email)

  new_address = Address.create(address)
  new_contact.add_extra_address(new_address)

  main_menu
end

def view_contacts

  if Contact.all.empty?
    puts "Add a contact first."
    main_menu
  else
    puts "\n"
    puts "Contacts: "
    puts "-----"
    Contact.all.each_with_index do |contact, index|
      puts "#{index + 1}  #{contact.full_name}"
    end

    puts "Enter the number of the contact to view all information:"
    user_input = gets.chomp
    @current_contact = Contact.all[user_input.to_i - 1]
    description(@current_contact)

    puts "Press 'p' to add a phone number.  Press 'e' to add a email address.  Press 'a' to add a new address."
    puts "Press 'd' to edit contact."
    puts "Press 'm' to return to main menu."
    input = gets.chomp
    if input == 'p'
      add_phone
    elsif input == 'd'
      edit_contact
    elsif input == 'm'
      main_menu
    elsif input =='e'
      add_email
    elsif input == 'a'
      add_address
    else
      main_menu
    end
  end
end

def description(contact)
  puts "\n"
  puts "#{contact.full_name}"
  puts "-----"
  puts "First Name:  #{contact.first_name} \n"
  puts "Last Name: #{contact.last_name} \n"
  contact.phone_number.each do |phone|
    puts "Phone number: #{phone.phone_number}"
  end
  contact.address.each do |address|
    puts "Address:  #{address.address}"
  end
  contact.email.each do |email|
    puts "Email address: #{email.email}"
  end
  puts "\n"
end

def delete_contact
  if Contact.all.empty?
    puts "Contact list empty.  Add a contact first."
    main_menu
  else
    puts "Contacts"
    puts "-----"
    Contact.all.each_with_index do |contact, index|
      puts "#{index + 1}  #{contact.full_name}"
    end

    puts "Enter the number of the contact you want to delete:"
    user_input = gets.chomp
    @current_contact = Contact.all[user_input.to_i - 1]
    puts 'Are you sure you want to delete this contact?  Type "yes" to confim or "no" to return to main menu.'
    user_choice = gets.chomp

    if user_choice == 'no'
      main_menu
    elsif user_choice == 'yes'
      Contact.all.delete_at(user_input.to_i - 1)
      puts "Contact deleted. \n"
      main_menu
    else
      main_menu
    end
  end
end



def edit_contact
  puts "Press 'n' to edit name.  Press 'a' to edit address.  Press 'p' to edit phone number. Press 'e' to edit email."
  puts "Press 'm' to return to main menu."
  puts "Press any other key to return to view contacts."
  user_input = gets.chomp

  if user_input == 'n'
    edit_name
  elsif user_input == 'a'
    edit_address
  elsif user_input == 'p'
    edit_phone
  elsif user_input == 'e'
    edit_email
  elsif user_input == 'm'
    main_menu
  else
    view_contacts
  end
end

def edit_name
  puts "Enter new first name: "
  new_first = gets.chomp
  puts "Enter new last name: "
  new_last = gets.chomp

  @current_contact.edit_name(new_first, new_last)
  puts "Name updated.  Changed to:  #{@current_contact.full_name}"

  edit_contact
end

def edit_phone
  puts "#{@current_contact.full_name}'s phone numbers:"
  @current_contact.phone_number.each_with_index do |phone, index|
    puts "#{index + 1} Phone number: #{phone.phone_number}"
  end
  puts "Select a phone number"
  user_input = gets.chomp

  puts "Enter new phone number: "
  new_phone = gets.chomp

  current_phone = @current_contact.phone_number[user_input.to_i - 1]

  current_phone.edit_phone(new_phone)
  puts "Phone updated.  Changed to:  #{current_phone.phone_number}"

  edit_contact
end


def add_phone
  puts "Enter another phone number:"
  user_phone = gets.chomp

  new_phone = Phone.create(user_phone)

  @current_contact.add_extra_phone(new_phone)

  @current_contact.phone_number.each do |phone|
    puts phone.phone_number
  end
  puts "Press 'a' to add another phone.  Press 'v' to view contacts."
  puts "Press any other key to return to main menu."
  user_input = gets.chomp
  if user_input == 'a'
    add_phone
  elsif user_input == 'v'
    view_contacts
  else
    main_menu
  end
end

def edit_email
  puts "#{@current_contact.full_name}'s email address:"
  @current_contact.email.each_with_index do |email, index|
    puts "#{index + 1} Email address: #{email.email}"
  end
  puts "Select email to edit:"
  user_input = gets.chomp
  puts "Enter new email:"
  new_email = gets.chomp

  current_email = @current_contact.email[user_input.to_i - 1]
  current_email.edit_email(new_email)
  puts "Email updated.  Changed to: #{current_email.email}"

  edit_contact
end

def add_email
  puts "Enter another email address:"
  user_email = gets.chomp

  new_email = Email.create(user_email)

  @current_contact.add_extra_email(new_email)

  @current_contact.email.each do |email|
    puts email.email
  end
  puts "Press 'a' to add another email.  Press 'v' to view contacts."
  puts "Press any other key to return to main menu."
  user_input = gets.chomp
  if user_input == 'a'
    add_email
  elsif user_input == 'v'
    view_contacts
  else
    main_menu
  end

end

def edit_address
  puts "#{@current_contact.full_name}'s address:"
  @current_contact.address.each_with_index do |address, index|
    puts "#{index + 1} Address: #{address.address}"
  end
  puts "Select address to edit:"
  user_input = gets.chomp
  puts "Enter new address:"
  new_address = gets.chomp

  current_address = @current_contact.address[user_input.to_i - 1]
  current_address.edit_address(new_address)
  puts "Address updated.  Changed to: #{current_address.address}"

  edit_contact
end

def add_address
  puts "Enter another address:"
  user_address = gets.chomp

  new_address = Address.create(user_address)

  @current_contact.add_extra_address(new_address)

  @current_contact.address.each do |address|
    puts address.address
  end
  puts "Press 'a' to add another address.  Press 'v' to view contacts."
  puts "Press any other key to return to main menu."
  user_input = gets.chomp
  if user_input == 'a'
    add_address
  elsif user_input == 'v'
    view_contacts
  else
    main_menu
  end
end

main_menu
