class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_locale
    'es-MX'
  end

end
