namespace :app do
  desc 'Keep the application alive'
  task :ping => :environment do
    Rails.logger.info 'Pinging application'
  end
end
