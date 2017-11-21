class WelcomeController < ApplicationController

  def index
    
    flash[:notice] = "ad"
  end
end
