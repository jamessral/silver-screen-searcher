class Api::V1::MoviesController < ApplicationController
  respond_to :html, :json

  def index
    @movies = Movie.all
    respond_with(@movies)
  end

  def search
    result = Movies::Search.call(params: search_params)
    binding.pry
    @movies = result.movies
    respond_with(@movies)
  end

  private

  def search_params
    params.permit(:title)
  end
end
