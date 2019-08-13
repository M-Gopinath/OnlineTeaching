require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment do
  require 'resque'
  require 'resque-scheduler'
  Resque.schedule = YAML.load_file(File.join(Rails.root.to_s, '/config/resque_schedule.yml')) # load the schedule
end
