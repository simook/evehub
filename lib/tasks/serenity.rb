task :worker => :environment do
  puts "Starting Serenity Workers"
  serenity = Delayed::Worker.new
  results = serenity.work_off 100
  puts "#{results[0]} jobs completed, #{results[1]} jobs failed"
end