Tml.configure do |config|
  config.application = {
      key: '0332a07e97af3d81f6fe9723cc083df3a45fbd39d1380691c62e445c598b8d5c',
      token: '0d94597cec4aa324ac764f53f6cb0e33ef5b3954144364f91f27fde8e8fc36fb'
  }

  config.cache = {
    :enabled  => false,
    :adapter  => 'memcache',
    :namespace => 'f5f578900616644c9fd7d4584101f68b51a4ca9c402a20e1c34f825c27834d16',
    :host     => 'localhost:11211',
    :version  => 1,
    :timeout  => 3600
  }

  #config.cache = {
  #    :enabled    => true,
  #    :adapter    => 'file',
  #    :path       => 'config/tml',
  #    :version    => 'current',
  #    :segmented  => false
  #}

  config.logger  = {
      :enabled  => true,
      :path     => "#{Rails.root}/log/tml.log",
      :level    => 'debug'
  }
end

I18n.backend = I18n::Backend::Tml.new
