
class ContactsLeadController

    def self.list
        contacts = ContactMessages.scan()
       contacts
          .map { |r| { :email => r.email, :name => r.name, :content => r.content } }
          .sort { |a, b| a[:created_at] <=> b[:created_at] }
          .to_json
    end

    def self.list_ID(valueid,valuelook)
        contacts = ContactMessages.scan(scan_filter: {
   		 valuelook => {
      			attribute_value_list: [valueid],
      			comparison_operator: "EQ", 
    		 },
  	})
          .map { |r| { :content => r.content } }
          .sort { |a, b| a[:created_at] <=> b[:created_at] }
          .to_json
    end


    def self.create(params)
	contacts = ContactMessages.new(id: SecureRandom.uuid, created_at: Time.now, updated_at: Time.now)
	item = LandpageLeads.new(id: SecureRandom.uuid, created_at: Time.now, updated_at: Time.now)

	if params[:cemail]== ValidateMailLandpage.new().valid_email(params[:cemail])
        
        	contacts.email = params[:cemail]
        	contacts.name = params[:cname]
        	contacts.content = params[:cmessage]
		contacts.save!
		
                item.first_name = params[:cname]
                item.last_name = ''
                item.phone = ''
                item.email = params[:cemail]
                item.company_name = ''
                item.company_industry = ''
                item.save!

	
	end
		contacts	
    end
    
end
