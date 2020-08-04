class ValidateMailLandpage
	def valid_email(value) 
	    return "Error Mail format." if value == '' || value.index('.')<0
   	    parsed = Mail::Address.new(value) 
		if parsed.address == value && parsed.local != parsed.address 
	 	  return value
		else
		  return "Error Mail format." 
    	    	end
	   rescue Mail::Field::ParseError
    	   return "Error Mail format." 
    	end 
end

