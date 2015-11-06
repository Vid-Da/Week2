require "sinatra"

get "/" do
	"My first Sinatra app."
end

get "/about" do
	"This is my first webpage. This would be excited if it works"
	@greeting = "Hello world"
	@time = Time.now
	@ingredients = ["cheese", "pepperoni", "anchoas"]
	erb(:author)
end

get "/pizza" do
	@ingredients = ["cheese", "pepperoni", "anchoas"]
	erb(:pizza)
end

get "/users/:username" do
	@username = params[:username]
	erb(:user_profile)
end

get "/hours/ago/:hoursago" do
	@hoursago = params[:hoursago]
	@ahora = Time.now.strftime("%H:%M")
	@requestedhour = (Time.now - @hoursago.to_i*3600).strftime("%H:%M")
	
	erb(:hours)
end