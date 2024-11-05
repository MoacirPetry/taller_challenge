namespace :books do

  desc "Clean all Books"
  task clean: :environment do
    Books.delete_all
    puts "Done - Deleted all Books!!"
  end

  desc "Creating Books"
  task create: :environment do
		if (ARGV.size == 2) && (ENV['n'] != "")
	  	ENV['n'].to_i.times do |i|
				title = Faker::Food.dish
        author = Faker::Number.decimal(2)
				publication_year = Faker::Food.description
				Books = "Books #{i} = #{name} - #{price}"
				puts "Registering... -> #{Books}"
				Books.create(title: title, author: author, publication_year: publication_year)
		  end
		else
			puts "You need inform the quantity of Books!"
			puts "e.g. rake Books:create n=40"
		end
  end
end