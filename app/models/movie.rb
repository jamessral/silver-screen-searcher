class Movie < ApplicationRecord
  # use this to add favorites functionality later
  # belongs_to :user

  validates_presence_of :tmdb_id
  validates_presence_of :title
end
