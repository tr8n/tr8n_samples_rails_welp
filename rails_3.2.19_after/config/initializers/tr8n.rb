Tr8n.configure do |config|
  config.application = {
    :host => "https://translationexchange.com",
    :key => "b248a0dd1c4c626c9",
    :secret => "38616813a1b8dff7d"
  }
  config.cache = {
    :enabled  => true,
    :adapter  => 'memcache',
    :host     => 'localhost:11211',
    :version  => 1,
    :timeout  => 3600
  }
  config.logger  = {
    :enabled  => false,
    :path     => "#{Rails.root}/log/tr8n.log",
    :level    => 'debug'
  }
end