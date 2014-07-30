require_relative '../../spec_helper'

describe TmdbEasy::Movie do
  let :movie do
    VCR.use_cassette 'fight_club', record: :once do
      TmdbEasy::Movie.find 550
    end
  end

  before { TmdbEasy::Base.api_key tmdb_api_key }

  it 'has a defined endpoint' do
    expect(TmdbEasy::Movie.endpoint).to be_eql 'movie'
  end

  describe 'dynamic attributes' do
    context 'with an existend attribute' do
      it 'returns the attribute value' do
        expect(movie.title).to be_eql 'Fight Club'
      end
    end

    context 'with an unexistent atribute' do
      it 'throws a NoMethodError exception' do
        expect { movie.unexistent_attribute }.to raise_error NoMethodError
      end
    end
  end

  describe '.search' do
    let(:terms) { 'fight club' }
    let(:movie_search) { TmdbEasy::Movie.search terms }
    let(:search_results) { TmdbEasy::Search.new('results' => [{ 'adult' => false, 'backdrop_path' => '/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg', 'id' => 550, 'original_title' => 'Fight Club', 'release_date' => '1999-10-14', 'poster_path' => '/2lECpi35Hnbpa4y46JX0aY3AWTy.jpg', 'popularity' => 13.6327066209895, 'title' => 'Fight Club', 'vote_average' => 7.5, 'vote_count' => 2614 }, { 'adult' => false, 'backdrop_path' => nil, 'id' => 151_912, 'original_title' => 'Jurassic Fight Club', 'release_date' => '', 'poster_path' => nil, 'popularity' => 0.46, 'title' => 'Jurassic Fight Club', 'vote_average' => 0.0, 'vote_count' => 0 }]) }

    it 'returns a collection of movie objects' do
      allow(TmdbEasy::Search).to receive(:fetch).with(terms, 'movie').and_return(search_results)

      capitilized_terms = terms.split(' ').map(&:capitalize).join(' ')

      VCR.use_cassette :search_with_full_details, record: :once do
        movie_search.each do |movie|
          expect(movie).to be_a TmdbEasy::Movie
          expect(movie.title).to be_include capitilized_terms
        end
      end
    end
  end
end
