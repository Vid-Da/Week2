require "rspec"

#ESTO SERIA CON FAKE CLASS
=begin 
class EmailProviderFake

	def initialize subject
		@subjects = subjects
	end

	def get_subjects
		@subjects
	end
end
=end
# A PARTIR DE AQUI ES CON STUB

class Wordchecker

	def initialize subject_provider
		@subject_provider = subject_provider
	end

	def check words
		provider_subjects = @subject provider.get_subjects
		
		words.reduce(true) do |result, word|
			result && provider_subjects.any? { |subject| subject.include?word }		
	end
end

RSpec.describe "Word counter" do
	
	describe "Email provider has no string" do
	
		it "should return true if no words given" do
			#provider = EmailProviderFake.new([])
			#lo de arriba pero con stub
			provider = instance_double("This could be whatever", :get_subjects => [])
			counter = Wordchecker.new(provider)
			expect(counter.check([])).to eq(true)
		end

		it "should return false when a word is included in the subject" do
			#provider = EmailProviderFake.new([])
			provider = instance_double("This could be whatever", :get_subjects => [])
			counter = Wordchecker.new(provider)
			expect(counter.check(["hola"])).to eq(false)
		end
	end

	describe "email provider has strings" do

		it "should return true when 1 word is included in the subject" do
			#provider = EmailProviderFake.new(["hola"])
			provider = instance_double("This could be whatever", :get_subjects => [])
			counter = Wordchecker.new(provider)
			expect(counter.check(["hola caracola"])).to eq(false)
		end
	end

end