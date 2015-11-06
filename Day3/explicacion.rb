class Array
	def my_each
	  i = 0
	  while i < self.size
		  yield(self[i])
		  i+=1
	end
	self
 end

#Ejemmplo de lo de arriba

=begin

["uno","dos","tres"].my_each do |numero|
	puts numero
end

["uno","dos","tres"] = self

my_each do |numero|
	puts numero
	=yield

=end

	def my_each_with_index
	  i = 0
	  while i < self.size
		  yield(self[i],i)
		  i+=1o
		end
		self
 	end

	def my_select
	  i = 0
	  while i < self.size
		  yield(self[i],i)
		   new_array << self[i]
		end
		i +=1
 	end

	#version de fer
	def my_select
		return self unless block_given?
		new_array = []
		my_each { |i| new_array << i if yield(i) }
	  new_array
	end

	def my_map
		return self unless block_given?
		new_array = []
		my_each { |i| new_array << i yield(i) }
	  new_array
	end

	#Procs = guarda un bloque dentro de una variable

		my_proc = Proc.new { |arg1| print "#{arg1}! " }

	def my_map my_block
		my_array = []
		each {|i| my_array << my_block.call(i)}
		my_array
	end
end

bloque = Proc.new {|item| item*2 }
[1,2,3].my_map bloque # => [2,4,6]

Fizzbuzz

	#lambda = como el procs pero mas severo, deja pasar menos cosas

