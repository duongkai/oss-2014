require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'json'

set :port, 4500
=begin
oss2014_1 | gangsta58
oss2014_2 | plenty31
oss2014_3 | headsail37
oss2014_4 | citole96
oss2014_5 | twine82 
JSON format: curl -H "Content-Type: application/json" -d '{"username":"tduong", "password":"123456"}' http://127.0.0.1:4500/auth
HTML format: 
=end

accepted_users = [
	{:username => 'oss2014_1', :password => 'gangsta58'},
	{:username => 'oss2014_2', :password => 'plenty31'},
	{:username => 'oss2014_3', :password => 'headsail37'},
	{:username => 'oss2014_4', :password => 'citole96'},
	{:username => 'oss2014_5', :password => 'twine82'}
]

def validate_user(credential)
	accepted_users.each do |user|
        if credential[:username] == user[:username] and 
            credential[:password] == user[:password] then
            return true
        end
    return false        
	end
end

post '/auth', :provides => :json do
    data = request.body.read
    parsed_identity = JSON.parse data
    return validate_user
end

=begin
a = '{"username":"tduong", "password":"123456"}'
parsed = JSON.parse a
p parsed["username"]
json({:username => 'tduong', :password => 'helloworld'})
=end