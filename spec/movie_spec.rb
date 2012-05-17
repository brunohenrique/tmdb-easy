require File.join(File.dirname(__FILE__), '..', 'lib', 'tmdb_easy.rb')

describe TmdbEasy::Movie do
  let(:api_key) { 'API_KEY' }

  context 'when I have a api_key' do
    subject           { TmdbEasy::Movie }
    before            { subject.api_key = api_key }

    describe 'Responses when request to http://api.themoviedb.org/2.1/Movie.search/ with keyword and api_key' do
      let(:keyword)   { 'zoombie' }
      let(:url_base)  { 'http://api.themoviedb.org/2.1/Movie.search/' }

      def get_response_should options
        options.merge :url_include => [], :and_response => ''
        Net::HTTP.should_receive(:get_response) do |url|
          options[:url_include].each do |text|
            url.to_s.should include(text)
          end
        end.and_return(stub(:body => options[:and_response]))
      end

      it 'should response with json' do
        get_response_should :url_include => [keyword, url_base, api_key],
                            :and_response => '{"i am": "a zoombie"}'
        subject.search(keyword)['i am'].should == 'a zoombie'
      end

      it 'should response with xml' do
        get_response_should :url_include => [keyword, url_base, api_key],
                            :and_response => '<movie>im a zoombie</movie>'
        subject.search(keyword, 'en', 'xml').first.text.should == 'im a zoombie'
      end

    end
  end

end
