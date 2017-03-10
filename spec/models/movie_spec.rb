require 'rails_helper'

describe Movie, type: :model do
  subject { build(:movie) }

  it 'should have a valid factory' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:query) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:tmdb_id) }
    it { should validate_presence_of(:title) }
  end
end
