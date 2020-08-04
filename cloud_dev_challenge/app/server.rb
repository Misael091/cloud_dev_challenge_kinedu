require 'sinatra'
require 'rubygems'
require 'aws-record'
require 'mail'
require_relative "models/landpage_lead.rb"
require_relative "models/validatemaillandpage.rb"
require_relative "models/contacts_lead.rb"
require_relative "controllers/landpage_lead_controller.rb"
require_relative "controllers/contacts_lead_controller.rb"

before do
  if (! request.body.read.empty? and request.body.size > 0)
    request.body.rewind
    @params = Sinatra::IndifferentHash.new
    @params.merge!(JSON.parse(request.body.read))
  end
end

##################################
# For the index page
##################################
get '/' do
  erb :index
end

get '/landpage' do
  erb :landpage
end


##################################
# For the API
##################################

get '/api/lead' do
  content_type :json
  items = LandpageLeadController.list
end

post '/api/lead' do
  content_type :json
  item = LandpageLeadController.create(params)
  item.to_h.to_json
end

#New changes Challenge Dev

get '/contact_messages' do
	content_type :json
	json_params=JSON.parse(request.params.to_json)
	if( !json_params.empty? )
		contact = ContactsLeadController.list_ID(json_params['email'],"email")
	else
	  	items = ContactsLeadController.list
	end
end

post '/contact_messages' do
  content_type :json
  item = ContactsLeadController.create(params)
  item.to_h.to_json
end


get '/contact_messages/:id' do
  content_type :json
  contact = ContactsLeadController.list_ID(params[:id],"name")
end




