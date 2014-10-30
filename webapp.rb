require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'json'

set :port, 4500

#set :bind, "0.0.0.0"
=begin
oss2014_1 | gangsta58
oss2014_2 | plenty31
oss2014_3 | headsail37
oss2014_4 | citole96
oss2014_5 | twine82 
JSON format: curl -H "Content-Type: application/json" -d '{"username":"tduong", "password":"123456"}' http://127.0.0.1:4500/auth
HTML format: 
=end
# enable CORS
before do
    content_type :json    
    headers 'Access-Control-Allow-Origin' => '*', 
        'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST']  
end

def validate_user(credential)
    accepted_users = [
        {:username => 'oss2014_1', :password => 'gangsta58'},
        {:username => 'oss2014_2', :password => 'plenty31'},
        {:username => 'oss2014_3', :password => 'headsail37'},
        {:username => 'oss2014_4', :password => 'citole96'},
        {:username => 'oss2014_5', :password => 'twine82'}
    ]

    accepted_users.each do |user|
        return true if credential["username"] == user[:username] and
            credential["password"] == user[:password]
    end
    false
end

# if Content-Type: application/json
get '/auth' do
    "This is test site for OSS 2014"
end
post '/auth' do
    data = request.body.read
    parsed_identity = JSON.parse(data)
    json({:authentication => validate_user(parsed_identity).to_s})
end

=begin
# if Content-Type: text/html
post '/auth', :provides => :html do
    puts "in html"
    check_username = params[:username]
    check_password = params[:password]
    json({:authentication => validate_user(
        {"username" => check_username, "password" => check_password})})
end
=end
=begin
a = '{"username":"tduong", "password":"123456"}'
parsed = JSON.parse a
p parsed["username"]
json({:username => 'tduong', :password => 'helloworld'})
=end
