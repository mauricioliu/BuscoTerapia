class AdminController < ApplicationController
  http_basic_authenticate_with :name => "btp", :password => "btp.123!"
  
  def index
  end

end
