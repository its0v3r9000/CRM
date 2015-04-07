load 'contact.rb'
require_relative 'contact'


class Rolodex

  attr_reader :contacts

	def initialize
	  @contacts = []
	  @id = 1
	end

	def add_contact(contact)
	  contact.id = @id
	  @contacts << contact
	  @id += 1
	end

	def find(contact_id)
		@contacts.find do |contact|
			contact.id == contact_id
		end
	end

  def delete_contact(contact)
    @contacts.delete(contact)
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
    add_contact(contact)
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
        modify_contact
      end
      puts "----------[END]----------"
  end

  #-------- [3] Delete contact ---------

  def delete_contact
    contact = display_contact
    puts "Is this the contact you wanted? [Y/N]"
    yesno = gets.chomp.downcase
      if yesno == "y"
        delete_contact(contact)
        Puts "#{contact} has been deleted"
      elsif yesno == "n"
        main_menu
      else
        puts "Input Error"
        main_menu
      end
      puts "----------[END]----------"
  end




  # ---------- Displays Contact [4][5][6]---------------
  def display_contact
    puts "Enter the ID of the id you are looking for"
    contact_id = gets.chomp.to_i
    contact = find(contact_id)
    puts contact
    return contact
  end

  def display_all
    puts "The contacts are:"
    @contacts.each do |x|
      puts "----------[#{x.id}]-----------"
      puts x
    end
    puts "----------[END]----------"
  end

  def display_by_attribute
    puts "Choose an attribute"
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"
    attribute = gets.chomp.to_i

    @contacts.each do |x|
      if attribute == 1
        print "#{x.id}: "
        puts x.first_name
      elsif attribute == 2
        print "#{x.id}: "
        puts x.last_name
      elsif attribute == 3
        print "#{x.id}: "
        puts x.email
      elsif attribute == 4
        print "#{x.id}: "
        puts x.note
      else
        puts "Incorrect input"
        display_by_attribute
      end
      "----------[END]----------"
    end
  end
end