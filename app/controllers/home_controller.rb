class HomeController < ApplicationController
  def index
    @search = Terapeutum.search(params[:search])
    @terapeutas = @search.all
  end

end
