namespace :setup do
  desc "Deleting all values"
  task clean: :environment do
    Book.delete_all
    puts "Done - Deleted all references!!"
    Rake::Task["book:clean"].execute
  end

  desc "Creating all values"
  task create: :environment do
    Rake::Task["product:create"].execute
  end

end