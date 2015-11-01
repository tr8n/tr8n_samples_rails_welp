class TestController < ApplicationController

  def index
  end

  def forms
    @user = User.new
  end

end
