class Movies::Search < Service
  BASE_URL = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=".freeze

  Result = Struct.new(:movies)

  attr_reader :params

  def initialize(params:)
    @params = params
  end

  def call
    if Movie.exists?(title: params[:title])
      binding.pry
      Result.new(Movie.where(title: params[:title]))
    else
      title = URI.escape(params[:title])
      uri = URI(BASE_URL + title)
      resp = JSON.parse(Net::HTTP.get(uri))
      cache_movies(resp['results'])
      Result.new(resp['results'])
    end
  end

  private

  def cache_movies(movies)
    movies.each do |movie|
      Movie.find_or_create_by(tmdb_id: movie['id']) do |m|
        m.title        = movie['title']
        m.overview     = movie['overview']
        m.release_date = movie['release_date']
        m.popularity   = movie['popularity']
        m.vote_count   = movie['vote_count']
        m.vote_average = movie['vote_average']
      end
    end
  end
end
