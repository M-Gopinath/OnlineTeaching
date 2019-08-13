resque_config = YAML.load_file(Rails.root.to_s + '/config/resque.yml')
Dir[File.join(Rails.root, 'app', 'jobs', '*.rb')].each { |file| require file }
Resque.redis = resque_config[Rails.env]


log_file = File.open("#{Rails.root}/log/resque.log", 'w+')
log_file.sync = true
Resque.logger = MonoLogger.new(log_file)
# Resque.logger.level = Logger::INFO# warn | error | debug | fatal
Resque.logger.level = Logger::DEBUG
# Resque.logger.level = [Logger::DEBUG, Logger::INFO, Logger::WARN, Logger::ERROR, Logger::FATAL]
