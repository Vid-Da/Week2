require_relative "./post.rb"

class Blog

	attr_reader :posts
	def initialize
		@current_page = 0
		@posts = []
	end

	def add_post(post)
		@posts.push(post)
	end

	def latest_posts
		@posts = @posts.sort do |post1,post2|
			post2.date <=> post1.date
		end
	end
end

=begin
blog = Blog.new
blog.add_post Post.new("Uno ", "08/25/2015", "blabla", "0")
blog.add_post Post.new("Dos ", "08/30/2015", "blabla", "0")
blog.add_post Post.new("Tres ", "08/31/2015", "blabla", "0")
blog.add_post Post.new("Cuarto ", "05/05/2015", " blabla", "y")
blog.add_post Post.new("Cinco ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Seis ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Siete ", "05/05/2015", "blabla", "0")
blog.add_post Post.new("Ocho ", "05/05/2015", "blabla", "0")

blog.create_front_page
=end