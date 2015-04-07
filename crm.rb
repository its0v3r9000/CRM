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
    @rolodex.add_contact(Contact.new("Big", "Ben", "big@ben.com", "it's a tower!"))
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
    @rolodex.add_new_contact if selection == 1
    @rolodex.modify_contact if selection == 2
    @rolodex.delete_contact if selection == 3
    @rolodex.display_all if selection == 4
    @rolodex.display_by_attribute if selection == 5
    @rolodex.display_contact if selection == 6
    exit if selection == 0
  end

  def main_menu
    while true
      print_main_menu
      selection = gets.chomp.to_i
      call_Selection(selection)
    end
  end





end

CRM.run