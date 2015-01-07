Tr8n.configure do |config|
  config.application = {
      host: 'http://localhost:3000',
      key: 'e328f674f3da28cbaf62aaf4a66079da5916ee2b3620fb082f0536ed8f0baff0',
      secret: 'f22a75eedf315a4321b9a036d16453821abf602b747917134c36ecbe40e586ff'
  }
  config.cache = {
    :enabled  => true,
    :adapter  => 'rails',
    # :host     => 'localhost:11211',
    :version  => 5,
    :timeout  => 3600
  }
  config.logger  = {
    :enabled  => true,
    :path     => "#{Rails.root}/log/tr8n.log",
    :level    => 'debug'
  }
end