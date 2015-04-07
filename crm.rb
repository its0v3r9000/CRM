load 'rolodex.rb'
load 'contact.rb'
require_relative 'rolodex'
require_relative 'contact'

class CRM
  # ------------- init -------------
  def self.run
    my_crm = CRM.new
    my_crm.main_menu
  end

  def initialize
    @rolodex = Rolodex.new
    @rolodex.add_contact(Contact.new("Big", "Lebowski", "thedude@dude.com", "He's the Dude"))
  end

  # -------------- Menu -----------------
  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Display one contact"
    puts "[0] Exit"
    puts "Enter a number: "
  end

  def call_Selection(selection)
    add_new_contact if selection == 1
    modify_contact if selection == 2
    delete_contact if selection == 3
    display_all if selection == 4
    display_by_attribute if selection == 5
    display_contact if selection == 6
    exit if selection == 0
  end

  def main_menu
    while true
      print_main_menu
      selection = gets.chomp.to_i
      call_Selection(selection)
    end
  end

  # ------------ [1] Add New contact -------------
  def add_new_contact
    print "First Name:"
    first_name = gets.chomp
    print "last name:"
    last_name = gets.chomp
    print "Email:"
    email = gets.chomp
    print "Note:"
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    @rolodex.add_contact(contact)
  end

  # --------------- [2] Modify Contact -------------
  def modify_contact
    contact = display_contact
    puts "Is this the contact you wanted? [Y/N]"
    yesno = gets.chomp.downcase
      if yesno == "y"
        puts "What do you want to modify from contact #{contact.id}: \n [1] email \n [2] firstname \n [3[ lastname \n [4] note ]"
        mod = gets.chomp.downcase
           if mod == "1"
            puts "-- what is the new email?"
            newemail = gets.chomp
            contact.email = newemail
            puts "-- email changed to #{contact.email}"

          elsif mod == "2"
            puts "-- what is the new first name?"
            newfirstname = gets.chomp
            contact.first_name  = newfirstname
            puts "-- first name changed to #{contact.first_name}"

          elsif mod == "3"
            puts "-- what is the new last name?"
            newlastname = gets.chomp
            contact.last_name = newlastname
            puts "-- last name changed to #{contact.last_name}"

          elsif mod == "4"
            puts "-- what is the new note?"
            newnote = gets.chomp
            contact.note = newnote
            puts "-- note changed to #{contact.note}"
          else
            puts "Inncorrect input"
            main_menu
          end
      else
        puts "Sorry, please enter the contact again"
        contact = display_contact
      end
  end

  #-------- [3] Delete contact ---------

  def delete_contact
    contact = display_contact
    puts "Is this the contact you wanted? [Y/N]"
    yesno = gets.chomp.downcase
      if yesno == "y"
        @rolodex.delete_contact(contact)
        Puts "#{contact} has been deleted"
      elsif yesno == "n"
        main_menu
      else
        puts "Input Error"
        main_menu
      end
  end




  # ---------- Displays Contact [4][5][6]---------------
  def display_contact
    puts "Enter the ID of the id you are looking for"
    contact_id = gets.chomp.to_i
    contact = @rolodex.find(contact_id)
    puts contact
    return contact
  end

  def display_all
    puts "The contacts are:"
    @rolodex.contacts.each do |x|
      contact = @rolodex.contacts
      puts contact
    end
  end

  def display_by_attribute
    puts "Choose an attribute"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"
    attribute = gets.chomp.to_i

    @rolodex.contacts.each do |x|
      if attribute = 1
        puts x.first_name
      elsif attribute = 2
        puts x.last_name
      elsif attribute = 3
        puts x.email
      elsif attribute = 4
        puts x.note
      else
        puts "Incorrect input"
        display_by_attribute
      end
    end
  end



end

CRM.run