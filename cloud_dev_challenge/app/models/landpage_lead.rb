##################################
# Web App with a DynamodDB table
##################################

# Class for DynamoDB table
# This could also be another file you depend on locally.

class LandpageLeads
    include Aws::Record
    string_attr :id, hash_key: true
    string_attr :first_name
    string_attr :last_name
    string_attr :phone
    string_attr :email
    string_attr :company_name
    string_attr :company_industry
    epoch_time_attr :created_at
    epoch_time_attr :updated_at    
  end
