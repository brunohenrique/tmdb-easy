require_relative '../../spec_helper'

describe TmdbEasy::Movie do
  before { TmdbEasy::Base.key api_key }

  it 'has a defined endpoint' do
    expect(described_class.endpoint).to be_eql 'movie'
  end

  context 'with a valid movie' do
    let :movie do
      VCR.use_cassette 'fight_club', record: :once do
        described_class.find 550
      end
    end

    describe 'dynamic attributes' do
      context 'with an existend attribute' do
        it 'returns the attribute value' do
          expect(movie.title).to be_eql 'Fight Club'
        end
      end

      context 'with an unexistent atribute' do
        it 'throws a NoMethodError exception' do
          expect{ movie.unexistent_attribute }.to raise_error NoMethodError
        end
      end
    end
  end
end
