require_relative '../../spec_helper'

describe TmdbEasy::Base do
  before { described_class.api_key 'api_key'}

  it 'has a defined API key' do
    expect(described_class.config[:api_key]).to be_eql 'api_key'
  end
end
