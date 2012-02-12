class HomeController < ApplicationController
  def index
    @search = Terapeuta.search(params[:search])
    @terapeutas = @search.all
  end

end
