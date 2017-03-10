require 'rails_helper'

describe Query, type: :model do
  subject { build(:query) }

  it 'should have a valid factory' do
    expect(subject).to be_valid
  end

  describe 'Associations' do
    it { should have_many(:movies) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:params) }
    it { should validate_uniqueness_of(:params) }
  end
end
