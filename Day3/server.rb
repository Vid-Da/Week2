require "pry"
require "sinatra"
require "sinatra/reloader" if development?
require_relative "./lib/login.rb"

enable(:sessions)

get "/username/:text" do
  text = params[:text]
  session[:username] = text
end

get "/password/:text" do
  text = params[:text]
  session[:password] = text
end

get "/login_show" do
  "Now in the session: " + session[:saved_value]
end

get "/" do
  erb(:login)
end

post "/verification" do
  username = params[:username]
  password = params[:password]
  if username == "paco" && password == "pepe"
    erb(:welcome)
  else
    erb(:denied)
  end
end