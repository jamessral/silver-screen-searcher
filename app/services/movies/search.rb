class Movies::Search < Service
  BASE_URL = "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['API_KEY']}&query=".freeze

  Result = Struct.new(:movies)

  attr_reader :params, :conn

  def initialize(params:)
    @params = params
  end

  def call
    if Movie.exists?(title: params[:title])
      Result.new(Movie.where(title: params[:title]))
    else
      title = URI.escape(params[:title])
      uri = URI(BASE_URL + title)
      response = JSON.parse(Net::HTTP.get(uri))
      cache_movies(response['results'])
      Result.new(response['results'])
    end
  end

  private

  def create_connection
    Faraday.new(url: BASE_URL) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.response :json
    end
  end

  def check_for_local(title)
    Movie.find(title: title)
  end

  def cache_movies(movies)
    movies.each do |movie|
      Movie.find_or_create_by(tmdb_id: movie['id']) do |m|
        m.title        = movie['title']
        m.overview     = movie['overview']
        m.release_date = movie['release_date']
      end
    end
  end
end
