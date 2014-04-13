require 'rspec'
require 'contact'
require 'phone'

describe 'contact' do
  before do
    Contact.clear
  end

  it 'is initialized with a first and last name' do
    test_contact = Contact.new('Bob', 'Smith')
    test_contact.should be_an_instance_of Contact
  end

  it 'lets you read the full name' do
    test_contact = Contact.new('Bob', 'Smith')
    test_contact.full_name.should eq 'Bob Smith'
  end

  it 'lets you add a new phone number to existing phone numbers array' do
    test_contact = Contact.create('Bob', 'Smith')
    test_contact.add_extra_phone('222-222-2222')
    test_contact.phone_number.should eq ['222-222-2222']
  end

  it 'lets you add a new email to existing email array' do
    test_contact = Contact.create('Bob', 'Smith')
    test_contact.add_extra_email('fake@fake.com')
    test_contact.email.should eq ['fake@fake.com']
  end

  it 'lets you edit the contacts name' do
    test_contact = Contact.create('Bob', 'Smith')
    test_contact.edit_name('Tom', 'Smart')
    test_contact.full_name.should eq 'Tom Smart'
  end

  describe '.all' do
    it 'is empty at first' do
      Contact.all.should eq []
    end
  end

  describe '#save' do
    it 'adds a contact to the array of saved contacts' do
      test_contact = Contact.new('Bob', 'Smith')
      test_contact.save
      Contact.all.should eq [test_contact]
    end
  end

  describe '.clear' do
    it 'empties out all of the saved contacts' do
      Contact.new('Bob', 'Smith').save
      Contact.clear
      Contact.all.should eq []
    end
  end

  describe '.create' do
    it 'makes a new instance of Contact' do
      test_contact = Contact.create('Bob', 'Smith')
      test_contact.should be_an_instance_of Contact
    end

    it 'saves the contact' do
      test_contact = Contact.create('Bob', 'Smith')
      Contact.all.should eq [test_contact]
    end
  end
end

describe 'Phone' do
  before do
    Phone.clear
  end

  it 'is initialized with a phone number' do
    test_phone = Phone.new('123-456-7890')
    test_phone.should be_an_instance_of Phone
  end

  it 'displays the phone number' do
    test_phone = Phone.new('123-456-7890')
    test_phone.phone_number.should eq '123-456-7890'
  end

  it 'is initialized with a phone number' do
    test_phone = Phone.new('123-456-7890')
    test_phone.edit_phone('222-333-4444')
    test_phone.phone_number.should eq '222-333-4444'
  end

  describe '.all' do
    it 'is empty at first' do
      Phone.all.should eq []
    end
  end

  describe '#save' do
    it 'adds a contact to the array of saved phone' do
      test_phone = Phone.new('123-456-7890')
      test_phone.save
      Phone.all.should eq [test_phone]
    end
  end

  describe '.clear' do
    it 'empties out all of the saved phone numbers' do
      Phone.new('123-456-7890').save
      Phone.clear
      Phone.all.should eq []
    end
  end

  describe '.create' do
    it 'makes a new instance of Phone' do
      test_phone = Phone.create('123-456-7890')
      test_phone.should be_an_instance_of Phone
    end

    it 'saves the phone' do
      test_phone = Phone.create('123-456-7890')
      Phone.all.should eq [test_phone]
    end
  end


end



