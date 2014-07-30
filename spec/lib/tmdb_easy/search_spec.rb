require_relative '../../spec_helper'

describe TmdbEasy::Search do
  before { TmdbEasy::Base.api_key tmdb_api_key }

  describe 'mounts endpoint by resource type' do
    subject(:search) { TmdbEasy::Search.fetch terms, resource_type }

    let(:terms) { 'fight club' }

    context 'when resource type is movie' do
      let(:resource_type) { 'movie' }

      it 'calls Base.fetch with right endpoint and terms (search/movie)' do
        allow(TmdbEasy::Base).to receive(:fetch).with('search/movie',  query: terms)
        search
      end

      it 'returns a search object' do
        VCR.use_cassette 'search', record: :once do
          expect(search).to be_a TmdbEasy::Search
        end
      end

      it 'returns results' do
        VCR.use_cassette 'search', record: :once do
          expect(search.results).to be_a Array
        end
      end
    end
  end
end
