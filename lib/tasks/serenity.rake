namespace :serenity do

  desc "This task will enqueue Serenity"
  task :run => :environment do
    puts "Enqueue Serenity..."
    Delayed::Job.enqueue Serenity.new
    puts "done."
  end

end