<p align="center">
  <img src="https://raw.github.com/tr8n/tr8n/master/doc/screenshots/tr8nlogo.png">
</p>

Tr8n Sample Application
==================

This sample application demonstrates some of Tr8n's capabilities


Installation
==================

To install the app, use:

```ssh
$ git clone https://github.com/tr8n/tr8n_rails_samples_welp.git
$ cd tr8n_rails_samples_welp/after
$ bundle
$ bundle exec rails s
```

Open your browser and point to:

http://localhost:3000


There are 2 folders inside that show the application before Tr8n was integrated and after.

To be able to translate any elements in the application, you must be a registered user on TranslationExchange.

Once you register as a new user, add a new application and copy the key/secret combination.

Open "config/initializers/tr8n.rb" and change the following lines:

```ruby
Tr8n.configure do |config|
  config.application = {
      :key => "YOUR KEY",
      :secret => "YOUR SECRET"
  }
end
```

This will allow you to add more languages, become app translator, and much more...


Links
==================

* Register on TranslationExchange.com: https://translationexchange.com

* Read TranslationExchange's documentation: http://wiki.tr8nhub.com

* Visit TranslationExchange's blog: http://blog.tr8nhub.com

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