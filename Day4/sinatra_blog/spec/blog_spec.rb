require_relative "../lib/blog.rb"

describe "add post" do 
	before :each do
		@blog = Blog.new
		@post = Post.new("Uno ", Time.now.strftime("%D %H:%M"), "blabla")
	end

		it "when input is empty return an empty array" do
		expect(@blog.add_post("")).to eq([""])
	end

	it "should return an array when a post when created" do
		expect(@blog.add_post(@post)).to eq([@post])
	end

	it "should return an array when a various posts are created" do
		@blog.add_post(@post)
		expect(@blog.add_post(@post)).to eq([@post, @post])
	end
end

describe "latest_posts" do 
	before :each do
		@blog = Blog.new
		@post = Post.new("Uno ", Time.now.strftime("%Y-%m-%d  %H:%M"), "blabla")
		@post1 = Post.new("Uno ", "2013-12-12 19:00", "blabla")
		@post2 = Post.new("Uno ", "2015-12-12 19:00", "blabla")
	end

	it "if I have only one post it should be always be the last" do
		@blog.add_post(@post)
		expect(@blog.latest_posts).to eq([@post])
	end

		it "if I have 2 posts it show first latest post" do
		@blog.add_post(@post)
		@blog.add_post(@post2)
		expect(@blog.latest_posts).to eq([@post2, @post])
	end

	it "if I have 3 posts it show first latest post" do
		@blog.add_post(@post)
		@blog.add_post(@post1)
		@blog.add_post(@post2)
		expect(@blog.latest_posts).to eq([@post2, @post, @post1])
	end

end