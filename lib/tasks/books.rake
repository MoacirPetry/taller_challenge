namespace :books do

  desc "Clean all Books"
  task clean: :environment do
    Book.delete_all
    puts "Done - Deleted all Books!!"
  end

  desc "Creating Books"
  task create: :environment do
		if (ARGV.size == 2) && (ENV['n'] != "")
	  	ENV['n'].to_i.times do |i|
				title = Faker::Book.title
        author = Faker::Book.author
				publication_year = 10.year.ago
				books = "Books #{i} = #{title} - #{author}"
				puts "Registering... -> #{books}"
				Book.create(title: title, author: author, publication_year: publication_year)
		  end
		else
			puts "You need inform the quantity of Books!"
			puts "e.g. rake Books:create n=40"
		end
  end
end