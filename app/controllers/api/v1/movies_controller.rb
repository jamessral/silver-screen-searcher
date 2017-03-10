class Api::V1::MoviesController < ApplicationController
  respond_to :json

  def index
    @movies = Movie.all
    respond_with(@movies)
  end

  def show
    respond_with(@movie)
  end

  def search
    result = Movies::Search.call(params: search_params)
    respond_with(result)
  end

  def update
    render :success
  end

  private

  def search_params
    params.permit(:title)
  end
end
