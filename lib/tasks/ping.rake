namespace :ping do

  desc 'Ping All'
  task :all => :environment do
    PingService.ping_all
  end
end
