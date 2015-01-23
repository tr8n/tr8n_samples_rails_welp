Tml.configure do |config|
  config.application = {
      token: 'f5f578900616644c9fd7d4584101f68b51a4ca9c402a20e1c34f825c27834d16'
  }

  #config.cache = {
  #  :enabled  => true,
  #  :adapter  => 'memcache',
  #  :namespace => 'e328f674f3da28cbaf62aaf4a66079da5916ee2b3620fb082f0536ed8f0baff0',
  #  :host     => 'localhost:11211',
  #  :version  => 1,
  #  :timeout  => 3600
  #}

  config.cache = {
      :enabled    => true,
      :adapter    => 'file',
      :path       => 'config/tml',
      :version    => 'current',
      :segmented  => false
  }

  config.logger  = {
    :enabled  => false,
    :path     => "#{Rails.root}/log/tml.log",
    :level    => 'debug'
  }
end