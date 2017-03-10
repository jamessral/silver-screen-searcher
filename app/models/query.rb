class Query < ApplicationRecord
  has_many :movies

  validates :params, presence: true, uniqueness: true
end
