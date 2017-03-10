require 'rails_helper'

describe 'Movies API' do
  subject { create(:movie) }

  describe 'GET Index' do
    it 'should return all movies' do
      get '/v1/movies'

      included_movie_ids = response.parsed_body&.map { |m| m['id'] }
      included_movie_titles = response.parsed_body&.map { |m| m['title'] }

      expect(included_movie_ids).to include(subject.id)
      expect(included_movie_titles).to include(subject.id)
    end
  end

  describe 'POST Search' do
    it 'should have a successfull request' do
      post '/v1/movies/search', title: 'Life'

      expect(request).to be_successful
    end
  end
end
