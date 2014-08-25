<p align="center">
  <img src="https://raw.github.com/tr8n/tr8n/master/doc/screenshots/tr8nlogo.png">
</p>

Tr8n Client SDK for Ruby on Rails
===================================
[![Build Status](https://travis-ci.org/tr8n/tr8n_rails_clientsdk.png?branch=rails-3.2.x)](https://travis-ci.org/tr8n/tr8n_rails_clientsdk)
[![Coverage Status](https://coveralls.io/repos/tr8n/tr8n_rails_clientsdk/badge.png)](https://coveralls.io/r/tr8n/tr8n_rails_clientsdk)
[![Gem Version](https://badge.fury.io/rb/tr8n_client_sdk.png)](http://badge.fury.io/rb/tr8n_client_sdk)
[![Dependency Status](https://www.versioneye.com/user/projects/53cda6a5225426f1e8000165/badge.svg?style=flat)](https://www.versioneye.com/user/projects/53cda6a5225426f1e8000165)
[![Project status](http://stillmaintained.com/tr8n/tr8n_ruby_core.png)](http://stillmaintained.com/tr8n/tr8n_ruby_core.png)

This Client SDK provides extensions necessary for translating Rails based application using the Tr8nHub service.


Tr8n Client SDK Sample
===================================

The best way to start using Tr8nHub is to run the sample application that comes bundled with this SDK.

```sh
  $ git clone https://github.com/tr8n/tr8n_rails_clientsdk.git
  $ cd tr8n_rails_clientsdk/spec/dummy
  $ bundle
  $ script/rails s
```

This will start the dummy application in development mode. The development mode uses Tr8nHub sandbox server for translations.


Alternatively, you can use the same sample application as a stand alone app:

https://github.com/tr8n/tr8n_rails_clientsdk_sample

This application is running at:

http://rails.tr8nhub.com


Another sample application that uses this SDK is available here:

https://github.com/tr8n/tr8n_samples_bookface_rails

Install it and see how it works.


Registering Your App
===================================

Before you can proceed with the integration, please register with https://translationexchange.com and create a new application.

At the end of the registration process you will be given a key and a secret. You will need to enter them in the initialization function of the Tr8n SDK.


Integration
===================================

To integrate Tr8n SDK into your app, all you need to do is:

Add the following gems to your Gemfile:

```ruby
  gem 'tr8n_client_sdk'
```

Install the gems:

```sh
  $ bundle
```

Add the following configuration to your Application.rb (or to the various environment files):

```ruby
    Tr8n.configure do |config|
      config.application = {
          :key => YOUR_APP_KEY,
          :secret => YOUR_APP_SECRET
      }
    end
```

In the HEAD section of your layout, add:

```ruby
  <%= tr8n_scripts_tag %>
```

You are done, tr8n is now running in your app.

Now you can simply add the default language selector anywhere on your page using:

```ruby
  <%= tr8n_language_selector_tag %>
```

And use TML (Translation Markup Language) to translate your strings, using:

```rails
  <%= tr("Hello World") %>
  <%= tr("You have {count||message}", :count => 5) %>
  <%= tr("{actor} sent {target} [bold: {count||gift}]", :actor => actor_user, :target => target_user, :count => 5) %>
  ...
```

Learn more about TML at: http://wiki.tr8nhub.com


Caching
===================================

You should enable caching for your application. Without caching you will be querying the service for new translations on every page load.
If you do it too much, you will be throttled. The translation service is designed to service the up-to-date translations only if you your translators are in translation mode.
For all other users you should serve translations from your cache.

To enable cache, simply add the following configuration to Tr8n config:

```ruby
    Tr8n.configure do |config|
      config.cache = {
          :enabled  => true,
          :adapter  => 'memcache',
          :host     => 'localhost:11211',
          :version  => 2,
          :timeout  => 3600
      }
    end
```

The following Cache adapters are supported:

Memcache, Redis, CDB, File

It is easy to add any other custom cache adapter as well.

Memcache and Redis adapters can do a realtime cache warmup - by loading the translations from the service and storing them in the cache.

To reset/upgrade your cache, you can simply call

```ruby
  Tr8n.cache.upgrade_version
```

All the keys stored in memory based cache are versioned. By upgrading the version you will effectively invalidate the old keys and the new keys will be loaded from the translation service.


CDB and File adapters require pre-generation. You can pre-generate your cache by running:

```sh
  $ rake tr8n:generate_cache:file
```

or

```sh
  $ rake tr8n:generate_cache:cdb
```

You can also do a combination of file-based adapters (for persistent cache) and memory-based adapters for serving the translations.


Logging
===================================

Tr8n comes with its own logger. If you would like to see what the SDK is doing behind the scene, enable the logger and provide the file path for the log file:

```ruby
    Tr8n.configure do |config|

      config.logger  = {
          :enabled  => true,
          :path     => "#{Rails.root}/log/tr8n.log",
          :level    => 'debug'
      }

    end
```


Rules Engine Customizations
===================================

Tr8n comes with default settings for the rules engine. For example, it assumes that you have the following methods in your ApplicationController:

```ruby
  def current_user
  end

  def current_locale
  end
```

Tr8n only needs the current_user method if your site needs to use gender based rules for the viewing user.

Similarly, if you prefer to use your own mechanism for storing and retrieving user's preferred and selected locales, you can provide the current_locale method.

If you need to adjust those method names, you can set them in the config:

```ruby
    Tr8n.configure do |config|

      config.current_user_method = :my_user

      config.current_locale_method = :my_locale

    end
```


Links
==================

* Register on TranslationExchange.com: https://translationexchange.com

* Read TranslationExchange's documentation: http://wiki.translationexchange.com

* Visit TranslationExchange's blog: http://blog.translationexchange.com

* Follow TranslationExchange on Twitter: https://twitter.com/translationx

* Connect with TranslationExchange on Facebook: https://www.facebook.com/translationexchange

* If you have any questions or suggestions, contact us: info@translationexchange.com


Copyright and license
==================

Copyright (c) 2014 Michael Berkovich, TranslationExchange.com

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.