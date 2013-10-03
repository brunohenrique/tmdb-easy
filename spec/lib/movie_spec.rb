require_relative '../spec_helper'

describe TmdbEasy::Movie do
  before { TmdbEasy::Base.key api_key }

  it 'has a defined endpoint' do
    expect(described_class.endpoint).to be_eql 'movie'
  end

  context 'with a valid movie' do
    let(:movie) { described_class.find 550 }

    it 'finds a movie by id' do
      VCR.use_cassette 'fight_club', record: :once do
        expect(movie['original_title']).to be_eql 'Fight Club'
      end
    end
  end
end
