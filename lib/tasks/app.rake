namespace :app do
  desc 'Keep the application alive'
  task :ping => :environment do
    require 'open-uri'
    status = open('http://ziecreative.com') do |f|
      f.status
    end
    Rails.logger.info "Pinging application.  Status was #{status.join(' ')}"
    puts "Pinging application.  Status was #{status.join(' ')}"
  end
end
