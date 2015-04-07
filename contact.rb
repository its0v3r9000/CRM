class Contact
	attr_accessor :id, :first_name, :last_name, :email, :note

	def initialize (first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	def to_s
    s =  "Contact ID = #{id} \n"
		s += "First Name: #{@first_name} \n"
    s += "Last Name: #{@last_name} \n"
    s += "Email: #{@email} \n"
    s += "Notes: #{@note} \n"
	end


end