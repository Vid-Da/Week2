require "sinatra"
require "sinatra/reloader" if development?
require_relative "./lib/blog.rb"
require_relative "./lib/post.rb"

blog = Blog.new
blog.add_post Post.new("Dos ", Time.now.strftime("%D %H:%M"), "Estoy en medio")
blog.add_post Post.new("Tres", "2013-12-12 19:00", "Soy el mas viejo")
blog.add_post Post.new("Uno ", "2015-12-12 19:00", "Soy el mas actual")

get "/" do
	@list = blog.posts
	erb(:home)
end

get "/latest_posts" do
	@list = blog.latest_posts
	erb(:latest_posts)
end